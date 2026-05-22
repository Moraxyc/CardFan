import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/database/app_database.dart';
import '../../core/providers/database_provider.dart';
import '../../l10n/generated/app_localizations.dart';

class BankCardsPage extends ConsumerWidget {
  const BankCardsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bankCards = ref.watch(_activeBankCardsProvider);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.bankCardsTitle)),
      body: bankCards.when(
        data: (items) {
          if (items.isEmpty) {
            return _EmptyBankCardsView(l10n: l10n);
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
        error: (error, stackTrace) => Center(
          child: Text(l10n.bankCardsLoadError(error: error.toString())),
        ),
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
  const _EmptyBankCardsView({required this.l10n});

  final AppLocalizations l10n;

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
              l10n.bankCardsEmptyTitle,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.bankCardsEmptySubtitle,
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
    final l10n = AppLocalizations.of(context);
    final details = [
      if (bankCard.cardName != null && bankCard.cardName!.isNotEmpty)
        bankCard.cardName!,
      l10n.bankCardLastFour(last4: bankCard.lastFourDigits),
      if (bankCard.statementDay != null)
        l10n.bankCardStatementDay(day: bankCard.statementDay!),
      if (bankCard.paymentDueDay != null)
        l10n.bankCardPaymentDay(day: bankCard.paymentDueDay!),
      if (bankCard.creditLimitCents != null)
        l10n.bankCardCreditLimit(
          amount: (bankCard.creditLimitCents! / 100).toStringAsFixed(2),
        ),
    ].join(l10n.commonDetailSeparator);

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
