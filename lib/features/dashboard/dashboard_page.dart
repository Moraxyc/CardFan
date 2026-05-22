import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/database/app_database.dart';
import '../../core/providers/database_provider.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets/status_card.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final simCards = ref.watch(_dashboardSimCardsProvider);
    final bankCards = ref.watch(_dashboardBankCardsProvider);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.dashboardTitle)),
      body: simCards.when(
        data: (sims) => bankCards.when(
          data: (cards) => _DashboardContent(simCards: sims, bankCards: cards),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Text(l10n.dashboardLoadError(error: error.toString())),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text(l10n.dashboardLoadError(error: error.toString())),
        ),
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
    final l10n = AppLocalizations.of(context);
    final hasRecords = simCards.isNotEmpty || bankCards.isNotEmpty;

    if (!hasRecords) {
      return _EmptyDashboardView(l10n: l10n);
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        StatusCard(
          title: l10n.dashboardSimCardTitle,
          subtitle: l10n.dashboardSimCardCount(count: simCards.length),
          statusText: _nextBillingText(l10n, simCards),
          level: StatusLevel.normal,
          icon: Icons.sim_card,
        ),
        const SizedBox(height: 8),
        StatusCard(
          title: l10n.dashboardBankCardTitle,
          subtitle: l10n.dashboardBankCardCount(count: bankCards.length),
          statusText: _nextPaymentText(l10n, bankCards),
          level: StatusLevel.normal,
          icon: Icons.credit_card,
        ),
      ],
    );
  }

  String _nextBillingText(AppLocalizations l10n, List<SimCard> cards) {
    final days = cards.map((card) => card.billingDay).whereType<int>().toList()
      ..sort();
    if (days.isEmpty) {
      return l10n.dashboardNoBillingDay;
    }
    return l10n.dashboardBillingDay(day: days.first);
  }

  String _nextPaymentText(AppLocalizations l10n, List<BankCard> cards) {
    final days =
        cards.map((card) => card.paymentDueDay).whereType<int>().toList()
          ..sort();
    if (days.isEmpty) {
      return l10n.dashboardNoPaymentDay;
    }
    return l10n.dashboardPaymentDay(day: days.first);
  }
}

class _EmptyDashboardView extends StatelessWidget {
  const _EmptyDashboardView({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.dashboardEmptyTitle,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.dashboardEmptySubtitle,
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
                  label: Text(l10n.dashboardAddSimCard),
                ),
                OutlinedButton.icon(
                  onPressed: () => context.pushNamed('newBankCard'),
                  icon: const Icon(Icons.credit_card),
                  label: Text(l10n.dashboardAddBankCard),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
