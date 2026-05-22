import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/database/app_database.dart';
import '../../core/providers/database_provider.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/utils.dart';
import 'phone_number_format.dart';

class SimCardFormPage extends ConsumerStatefulWidget {
  const SimCardFormPage({super.key, this.simCardId});

  final String? simCardId;

  @override
  ConsumerState<SimCardFormPage> createState() => _SimCardFormPageState();
}

class _SimCardFormPageState extends ConsumerState<SimCardFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _carrierNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _planNameController = TextEditingController();
  final _monthlyFeeController = TextEditingController();
  final _billingDayController = TextEditingController();
  final _notesController = TextEditingController();

  SimCard? _existing;
  bool _loaded = false;
  bool _saving = false;

  bool get _isEditing => widget.simCardId != null;

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
    _carrierNameController.dispose();
    _phoneNumberController.dispose();
    _planNameController.dispose();
    _monthlyFeeController.dispose();
    _billingDayController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _loadExisting() async {
    final id = widget.simCardId;
    if (id == null) {
      return;
    }

    final simCard = await ref.read(simCardsDaoProvider).getById(id);
    if (!mounted) {
      return;
    }

    if (simCard == null || simCard.deletedAt != null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).simCardMissing)),
      );
      context.pop();
      return;
    }

    setState(() {
      _existing = simCard;
      _carrierNameController.text = simCard.carrierName;
      _phoneNumberController.text = simCard.phoneNumber;
      _planNameController.text = simCard.planName ?? '';
      _monthlyFeeController.text = simCard.monthlyFeeCents == null
          ? ''
          : (simCard.monthlyFeeCents! / 100).toStringAsFixed(2);
      _billingDayController.text = simCard.billingDay?.toString() ?? '';
      _notesController.text = simCard.notes ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? l10n.simCardEditTitle : l10n.simCardAddTitle),
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
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  key: const Key('carrierNameField'),
                  controller: _carrierNameController,
                  decoration: InputDecoration(
                    labelText: l10n.simCardCarrierLabel,
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n.simCardCarrierRequired;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('phoneNumberField'),
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    labelText: l10n.simCardPhoneLabel,
                  ),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  validator: (v) => _validatePhoneNumber(l10n, v),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('planNameField'),
                  controller: _planNameController,
                  decoration: InputDecoration(labelText: l10n.simCardPlanLabel),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('monthlyFeeField'),
                  controller: _monthlyFeeController,
                  decoration: InputDecoration(
                    labelText: l10n.simCardMonthlyFeeLabel,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (v) => _validateMonthlyFee(l10n, v),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<int>(
                  key: const Key('billingDayField'),
                  decoration: InputDecoration(
                    labelText: l10n.simCardBillingDayLabel,
                  ),
                  initialValue: _parseNullableInt(_billingDayController.text),
                  items: List.generate(31, (index) {
                    final day = index + 1;
                    return DropdownMenuItem(
                      value: day,
                      child: Text(l10n.commonDayOfMonth(day: day)),
                    );
                  }),
                  onChanged: (value) {
                    _billingDayController.text = value?.toString() ?? '';
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('notesField'),
                  controller: _notesController,
                  decoration: InputDecoration(
                    labelText: l10n.simCardNotesLabel,
                  ),
                  maxLines: 3,
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

  String? _validatePhoneNumber(AppLocalizations l10n, String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return l10n.simCardPhoneRequired;
    }

    if (normalizePhoneNumberToE164(trimmed) == null) {
      return l10n.simCardPhoneInvalid;
    }
    return null;
  }

  String? _validateMonthlyFee(AppLocalizations l10n, String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return null;
    }

    final pattern = RegExp(r'^\d{1,8}(\.\d{1,2})?$');
    if (!pattern.hasMatch(trimmed)) {
      return l10n.simCardMonthlyFeeTooPrecise;
    }

    if (_parseMonthlyFeeCents(trimmed) == null) {
      return l10n.simCardMonthlyFeeInvalid;
    }

    return null;
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _saving = true);
    final now = DateTime.now().toUtc();
    final dao = ref.read(simCardsDaoProvider);
    final id = _existing?.id ?? _newId();
    final monthlyFeeCents = _parseMonthlyFeeCents(_monthlyFeeController.text);
    final billingDay = _parseNullableInt(_billingDayController.text);

    try {
      if (_existing == null) {
        await dao.create(
          SimCardsCompanion.insert(
            id: id,
            carrierName: _carrierNameController.text.trim(),
            phoneNumber: normalizePhoneNumberToE164(
              _phoneNumberController.text,
            )!,
            planName: Value(blankToNull(_planNameController.text)),
            monthlyFeeCents: Value(monthlyFeeCents),
            billingDay: Value(billingDay),
            notes: Value(blankToNull(_notesController.text)),
            createdAt: now,
            updatedAt: now,
          ),
        );
      } else {
        await dao.updateRecord(
          SimCardsCompanion(
            id: Value(id),
            carrierName: Value(_carrierNameController.text.trim()),
            phoneNumber: Value(
              normalizePhoneNumberToE164(_phoneNumberController.text)!,
            ),
            planName: Value(blankToNull(_planNameController.text)),
            monthlyFeeCents: Value(monthlyFeeCents),
            billingDay: Value(billingDay),
            notes: Value(blankToNull(_notesController.text)),
            updatedAt: Value(now),
          ),
        );
      }

      if (mounted) {
        context.pop();
      }
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  Future<void> _confirmDelete() async {
    final l10n = AppLocalizations.of(context);
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(l10n.simCardDeleteTitle),
          content: Text(l10n.simCardDeleteMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(l10n.actionCancel),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(l10n.actionConfirmDelete),
            ),
          ],
        );
      },
    );

    if (shouldDelete != true || _existing == null) {
      return;
    }

    await ref
        .read(simCardsDaoProvider)
        .softDelete(_existing!.id, DateTime.now().toUtc());
    if (mounted) {
      context.pop();
    }
  }

  int? _parseMonthlyFeeCents(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return null;
    }
    final parts = trimmed.split('.');
    final yuan = int.parse(parts[0]);
    final cents = parts.length == 2 ? int.parse(parts[1].padRight(2, '0')) : 0;
    return yuan * 100 + cents;
  }

  int? _parseNullableInt(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return null;
    }
    return int.parse(trimmed);
  }

  String _newId() {
    return 'sim-${DateTime.now().microsecondsSinceEpoch}';
  }
}
