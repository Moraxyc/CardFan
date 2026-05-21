import 'package:flutter/material.dart';

import '../../shared/widgets/placeholder_section.dart';
import '../../shared/widgets/status_card.dart';

class BillsPage extends StatelessWidget {
  const BillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('账单'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: const [
          StatusCard(
            title: '5 月信用卡账单',
            subtitle: '还款日：2026-05-18',
            statusText: '逾期风险',
            level: StatusLevel.danger,
            icon: Icons.warning_amber,
          ),
          PlaceholderSection(
            title: '账单页占位',
            description: '后续会展示每张银行卡的账单金额、账单日、还款日和状态。',
            icon: Icons.receipt_long,
          ),
        ],
      ),
    );
  }
}
