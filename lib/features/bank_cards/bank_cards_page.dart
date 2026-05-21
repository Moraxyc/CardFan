import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/database/app_database.dart';
import '../../core/providers/database_provider.dart';

class BankCardsPage extends ConsumerWidget {
  const BankCardsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bankCards = ref.watch(_activeBankCardsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('银行卡')),
      body: bankCards.when(
        data: (items) {
          if (items.isEmpty) {
            return const _EmptyBankCardsView();
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return _BankCardListTile(bankCard: items[index]);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('加载银行卡失败：$error')),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'bankCardsAddFab',
        onPressed: () => context.pushNamed('newBankCard'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

final _activeBankCardsProvider = StreamProvider<List<BankCard>>((ref) {
  return ref.watch(bankCardsDaoProvider).watchActive();
});

class _EmptyBankCardsView extends StatelessWidget {
  const _EmptyBankCardsView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.credit_card_outlined,
              size: 56,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              '还没有银行卡',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              '添加第一张银行卡，记录账单日和还款日。',
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

class _BankCardListTile extends StatelessWidget {
  const _BankCardListTile({required this.bankCard});

  final BankCard bankCard;

  @override
  Widget build(BuildContext context) {
    final details = [
      if (bankCard.cardName != null && bankCard.cardName!.isNotEmpty)
        bankCard.cardName!,
      '尾号 ${bankCard.lastFourDigits}',
      if (bankCard.statementDay != null) '账单日 ${bankCard.statementDay} 日',
      if (bankCard.paymentDueDay != null) '还款日 ${bankCard.paymentDueDay} 日',
      if (bankCard.creditLimitCents != null)
        '额度 ¥${(bankCard.creditLimitCents! / 100).toStringAsFixed(2)}',
    ].join(' · ');

    return Card(
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.credit_card)),
        title: Text(bankCard.bankName),
        subtitle: details.isNotEmpty ? Text(details) : null,
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.pushNamed(
          'editBankCard',
          pathParameters: {'id': bankCard.id},
        ),
      ),
    );
  }
}
