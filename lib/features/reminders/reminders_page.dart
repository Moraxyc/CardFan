import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/database/app_database.dart';
import '../../core/providers/database_provider.dart';
import 'reminder_date_formatter.dart';

class RemindersPage extends ConsumerWidget {
  const RemindersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminders = ref.watch(_activeRemindersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('提醒')),
      body: reminders.when(
        data: (items) {
          if (items.isEmpty) {
            return const _EmptyRemindersView();
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return _ReminderListTile(reminder: items[index]);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('加载提醒失败：$error')),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'remindersAddFab',
        onPressed: () => context.pushNamed('newReminder'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

final _activeRemindersProvider = StreamProvider<List<Reminder>>((ref) {
  return ref.watch(remindersDaoProvider).watchActive();
});

class _EmptyRemindersView extends StatelessWidget {
  const _EmptyRemindersView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.notifications_active_outlined,
              size: 56,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              '还没有提醒',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              '添加一个提醒',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReminderListTile extends StatelessWidget {
  const _ReminderListTile({required this.reminder});

  final Reminder reminder;

  @override
  Widget build(BuildContext context) {
    final details = [
      formatReminderDate(reminder.scheduledAt),
      if (reminder.body != null && reminder.body!.isNotEmpty) reminder.body!,
      reminder.enabled ? '已开启' : '已关闭',
    ].join(' · ');

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(
            reminder.enabled
                ? Icons.notifications_active
                : Icons.notifications_off,
          ),
        ),
        title: Text(reminder.title),
        subtitle: Text(details),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.pushNamed(
          'editReminder',
          pathParameters: {'id': reminder.id},
        ),
      ),
    );
  }
}
