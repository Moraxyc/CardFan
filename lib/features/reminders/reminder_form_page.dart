import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../core/database/app_database.dart';
import '../../core/providers/database_provider.dart';
import '../../core/providers/notification_provider.dart';
import '../../shared/utils.dart';
import 'reminder_date_formatter.dart';

class ReminderFormPage extends ConsumerStatefulWidget {
  const ReminderFormPage({super.key, this.reminderId});

  final String? reminderId;

  @override
  ConsumerState<ReminderFormPage> createState() => _ReminderFormPageState();
}

class _ReminderFormPageState extends ConsumerState<ReminderFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  Reminder? _existing;
  DateTime? _scheduledAt;
  bool _enabled = true;
  bool _loaded = false;
  bool _saving = false;

  bool get _isEditing => widget.reminderId != null;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loaded) {
      _loaded = true;
      _loadExisting();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  Future<void> _loadExisting() async {
    final id = widget.reminderId;
    if (id == null) return;

    final reminder = await ref.read(remindersDaoProvider).getById(id);
    if (!mounted) return;

    if (reminder == null || reminder.deletedAt != null) {
      final l10n = AppLocalizations.of(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.reminderMissing)));
      context.pop();
      return;
    }

    setState(() {
      _existing = reminder;
      _titleController.text = reminder.title;
      _bodyController.text = reminder.body ?? '';
      _scheduledAt = reminder.scheduledAt;
      _enabled = reminder.enabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final notificationService = ref.watch(notificationServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEditing ? l10n.reminderEditTitle : l10n.reminderAddTitle,
        ),
        actions: [
          if (_isEditing)
            TextButton(
              onPressed: _saving || _existing == null ? null : _confirmDelete,
              child: Text(l10n.actionDelete),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (!notificationService.supportsNotifications) ...[
            Card(
              child: ListTile(
                leading: const Icon(Icons.info_outline),
                title: Text(l10n.reminderUnsupportedNotificationsTitle),
                subtitle: Text(l10n.reminderUnsupportedNotificationsSubtitle),
              ),
            ),
            const SizedBox(height: 12),
          ] else if (!notificationService.supportsOfflineScheduling) ...[
            Card(
              child: ListTile(
                leading: const Icon(Icons.info_outline),
                title: Text(l10n.reminderUnsupportedOfflineTitle),
                subtitle: Text(l10n.reminderUnsupportedOfflineSubtitle),
              ),
            ),
            const SizedBox(height: 12),
          ],
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  key: const Key('reminderTitleField'),
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: l10n.reminderTitleLabel,
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n.reminderTitleRequired;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('reminderBodyField'),
                  controller: _bodyController,
                  decoration: InputDecoration(
                    labelText: l10n.reminderBodyLabel,
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 12),
                FormField<DateTime>(
                  key: const Key('scheduledAtValidator'),
                  initialValue: _scheduledAt,
                  validator: (_) =>
                      _scheduledAt == null ? l10n.reminderTimeRequired : null,
                  builder: (field) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          key: const Key('scheduledAtField'),
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(Icons.schedule),
                          title: Text(l10n.reminderTimeLabel),
                          subtitle: Text(
                            _scheduledAt == null
                                ? l10n.reminderTimeUnselected
                                : formatReminderDate(_scheduledAt!),
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: _pickScheduledAt,
                        ),
                        if (field.hasError)
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              field.errorText!,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 12),
                SwitchListTile(
                  key: const Key('reminderEnabledSwitch'),
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.reminderEnableNotifications),
                  subtitle: Text(l10n.reminderEnableNotificationsSubtitle),
                  value: _enabled,
                  onChanged: (value) => setState(() => _enabled = value),
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: _saving ? null : _save,
                  icon: _saving
                      ? const SizedBox.square(
                          dimension: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.save),
                  label: Text(l10n.actionSave),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickScheduledAt() async {
    final now = DateTime.now();
    final initial = _scheduledAt ?? now;
    final date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 10),
    );
    if (date == null || !mounted) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initial),
    );
    if (time == null) return;

    var scheduledAt = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    final currentTime = DateTime.now();
    if (!scheduledAt.isAfter(currentTime)) {
      scheduledAt = currentTime.add(const Duration(minutes: 1));
    }

    setState(() {
      _scheduledAt = scheduledAt.toUtc();
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _saving = true);
    final dao = ref.read(remindersDaoProvider);
    final scheduler = ref.read(notificationSchedulerProvider);
    final notificationService = ref.read(notificationServiceProvider);
    final now = DateTime.now().toUtc();
    final id = _existing?.id ?? 'rem-${DateTime.now().microsecondsSinceEpoch}';
    final previousNotificationId = _existing?.notificationId;

    try {
      final reminder = Reminder(
        id: id,
        title: _titleController.text.trim(),
        body: blankToNull(_bodyController.text),
        scheduledAt: _scheduledAt!,
        notificationId: previousNotificationId,
        enabled: _enabled,
        createdAt: _existing?.createdAt ?? now,
        updatedAt: now,
        deletedAt: null,
        syncStatus: _existing == null ? 'local' : 'pending',
        remoteId: _existing?.remoteId,
      );
      final notificationId = await scheduler.rescheduleReminder(
        reminder,
        previousNotificationId: previousNotificationId,
      );
      final enabled = _enabled && notificationId != null;
      final offlineSchedulingUnsupported =
          enabled && !notificationService.supportsOfflineScheduling;

      if (_existing == null) {
        await dao.create(
          RemindersCompanion.insert(
            id: id,
            title: reminder.title,
            body: Value(reminder.body),
            scheduledAt: reminder.scheduledAt,
            notificationId: Value(notificationId),
            enabled: Value(enabled),
            createdAt: now,
            updatedAt: now,
          ),
        );
      } else {
        await dao.updateRecord(
          RemindersCompanion(
            id: Value(id),
            title: Value(reminder.title),
            body: Value(reminder.body),
            scheduledAt: Value(reminder.scheduledAt),
            notificationId: Value(notificationId),
            enabled: Value(enabled),
            updatedAt: Value(now),
          ),
        );
      }

      if (mounted) {
        if (offlineSchedulingUnsupported) {
          final l10n = AppLocalizations.of(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.reminderSavedOfflineUnsupported)),
          );
        }
        context.pop();
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _confirmDelete() async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) {
        final dialogL10n = AppLocalizations.of(context);
        return AlertDialog(
          title: Text(dialogL10n.reminderDeleteTitle),
          content: Text(dialogL10n.reminderDeleteMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(dialogL10n.actionCancel),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(dialogL10n.actionConfirmDelete),
            ),
          ],
        );
      },
    );

    if (shouldDelete != true || _existing == null) return;

    await ref
        .read(notificationSchedulerProvider)
        .cancelReminder(_existing!.notificationId);
    await ref
        .read(remindersDaoProvider)
        .softDelete(_existing!.id, DateTime.now().toUtc());
    if (mounted) context.pop();
  }
}
