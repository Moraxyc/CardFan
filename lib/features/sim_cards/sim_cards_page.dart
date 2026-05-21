import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/database/app_database.dart';
import '../../core/providers/database_provider.dart';
import 'phone_number_format.dart';

class SimCardsPage extends ConsumerWidget {
  const SimCardsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final simCards = ref.watch(_activeSimCardsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('SIM 卡')),
      body: simCards.when(
        data: (items) {
          if (items.isEmpty) {
            return const _EmptySimCardsView();
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return _SimCardListTile(simCard: items[index]);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('加载 SIM 卡失败：$error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed('newSimCard'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

final _activeSimCardsProvider = StreamProvider<List<SimCard>>((ref) {
  return ref.watch(simCardsDaoProvider).watchActive();
});

class _EmptySimCardsView extends StatelessWidget {
  const _EmptySimCardsView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.sim_card_outlined,
              size: 56,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              '还没有 SIM 卡',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              '添加第一张 SIM 卡，记录号码、套餐和续费信息。',
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

class _SimCardListTile extends StatelessWidget {
  const _SimCardListTile({required this.simCard});

  final SimCard simCard;

  @override
  Widget build(BuildContext context) {
    final details = [
      if (simCard.planName != null && simCard.planName!.isNotEmpty)
        simCard.planName!,
      if (simCard.monthlyFeeCents != null)
        '¥${(simCard.monthlyFeeCents! / 100).toStringAsFixed(2)}',
      if (simCard.billingDay != null) '每月 ${simCard.billingDay} 日',
    ].join(' · ');

    return Card(
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.sim_card)),
        title: Text(simCard.carrierName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(formatPhoneNumberForDisplay(simCard.phoneNumber)),
            if (details.isNotEmpty) Text(details),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.pushNamed(
          'editSimCard',
          pathParameters: {'id': simCard.id},
        ),
      ),
    );
  }
}
