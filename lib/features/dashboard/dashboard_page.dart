import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/database/app_database.dart';
import '../../core/providers/database_provider.dart';
import '../../shared/widgets/status_card.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final simCards = ref.watch(_dashboardSimCardsProvider);
    final bankCards = ref.watch(_dashboardBankCardsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('首页')),
      body: simCards.when(
        data: (sims) => bankCards.when(
          data: (cards) => _DashboardContent(simCards: sims, bankCards: cards),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('加载首页失败：$error')),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('加载首页失败：$error')),
      ),
    );
  }
}

final _dashboardSimCardsProvider = StreamProvider<List<SimCard>>((ref) {
  return ref.watch(simCardsDaoProvider).watchActive();
});

final _dashboardBankCardsProvider = StreamProvider<List<BankCard>>((ref) {
  return ref.watch(bankCardsDaoProvider).watchActive();
});

class _DashboardContent extends StatelessWidget {
  const _DashboardContent({required this.simCards, required this.bankCards});

  final List<SimCard> simCards;
  final List<BankCard> bankCards;

  @override
  Widget build(BuildContext context) {
    final hasRecords = simCards.isNotEmpty || bankCards.isNotEmpty;

    if (!hasRecords) {
      return const _EmptyDashboardView();
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        StatusCard(
          title: 'SIM 卡',
          subtitle: '${simCards.length} 张 SIM 卡',
          statusText: _nextBillingText(simCards),
          level: StatusLevel.normal,
          icon: Icons.sim_card,
        ),
        const SizedBox(height: 8),
        StatusCard(
          title: '银行卡',
          subtitle: '${bankCards.length} 张银行卡',
          statusText: _nextPaymentText(bankCards),
          level: StatusLevel.normal,
          icon: Icons.credit_card,
        ),
      ],
    );
  }

  String _nextBillingText(List<SimCard> cards) {
    final days = cards.map((card) => card.billingDay).whereType<int>().toList()
      ..sort();
    if (days.isEmpty) {
      return '未设置续费日';
    }
    return '续费日：每月 ${days.first} 日';
  }

  String _nextPaymentText(List<BankCard> cards) {
    final days =
        cards.map((card) => card.paymentDueDay).whereType<int>().toList()
          ..sort();
    if (days.isEmpty) {
      return '未设置还款日';
    }
    return '还款日：每月 ${days.first} 日';
  }
}

class _EmptyDashboardView extends StatelessWidget {
  const _EmptyDashboardView();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '还没有卡片记录',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              '先添加 SIM 卡或银行卡，首页会自动汇总本地数据。',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilledButton.icon(
                  onPressed: () => context.pushNamed('newSimCard'),
                  icon: const Icon(Icons.sim_card),
                  label: const Text('添加 SIM 卡'),
                ),
                OutlinedButton.icon(
                  onPressed: () => context.pushNamed('newBankCard'),
                  icon: const Icon(Icons.credit_card),
                  label: const Text('添加银行卡'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
