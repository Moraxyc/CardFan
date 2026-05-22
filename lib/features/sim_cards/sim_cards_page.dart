import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/database/app_database.dart';
import '../../core/providers/database_provider.dart';
import '../../l10n/generated/app_localizations.dart';
import 'phone_number_format.dart';

class SimCardsPage extends ConsumerWidget {
  const SimCardsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final simCards = ref.watch(_activeSimCardsProvider);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.simCardsTitle)),
      body: simCards.when(
        data: (items) {
          if (items.isEmpty) {
            return _EmptySimCardsView(l10n: l10n);
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
        error: (error, stackTrace) => Center(
          child: Text(l10n.simCardsLoadError(error: error.toString())),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'simCardsAddFab',
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
  const _EmptySimCardsView({required this.l10n});

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
              Icons.sim_card_outlined,
              size: 56,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.simCardsEmptyTitle,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.simCardsEmptySubtitle,
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
    final l10n = AppLocalizations.of(context);
    final details = [
      if (simCard.planName != null && simCard.planName!.isNotEmpty)
        simCard.planName!,
      if (simCard.monthlyFeeCents != null)
        l10n.simCardMonthlyFee(
          amount: (simCard.monthlyFeeCents! / 100).toStringAsFixed(2),
        ),
      if (simCard.billingDay != null)
        l10n.simCardBillingDay(day: simCard.billingDay!),
    ].join(l10n.commonDetailSeparator);

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
