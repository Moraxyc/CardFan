import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/bank_cards/bank_cards_page.dart';
import '../../features/bills/bills_page.dart';
import '../../features/dashboard/dashboard_page.dart';
import '../../features/reminders/reminders_page.dart';
import '../../features/settings/settings_page.dart';
import '../../features/shell/app_shell.dart';
import '../../features/sim_cards/sim_card_form_page.dart';
import '../../features/sim_cards/sim_cards_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/sim-cards/new',
        name: 'newSimCard',
        builder: (context, state) => const SimCardFormPage(),
      ),
      GoRoute(
        path: '/sim-cards/:id/edit',
        name: 'editSimCard',
        builder: (context, state) {
          return SimCardFormPage(simCardId: state.pathParameters['id']);
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                name: 'dashboard',
                builder: (context, state) => const DashboardPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/sim-cards',
                name: 'simCards',
                builder: (context, state) => const SimCardsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/bank-cards',
                name: 'bankCards',
                builder: (context, state) => const BankCardsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/bills',
                name: 'bills',
                builder: (context, state) => const BillsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/reminders',
                name: 'reminders',
                builder: (context, state) => const RemindersPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                name: 'settings',
                builder: (context, state) => const SettingsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
