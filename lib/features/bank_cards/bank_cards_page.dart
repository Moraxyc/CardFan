import 'package:flutter/material.dart';

import '../../shared/widgets/placeholder_section.dart';
import '../../shared/widgets/status_card.dart';

class BankCardsPage extends StatelessWidget {
  const BankCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('银行卡')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: const [
          StatusCard(
            title: '招商银行信用卡',
            subtitle: '账单日：每月 8 日｜还款日：每月 18 日',
            statusText: '10 天内',
            level: StatusLevel.warning,
            icon: Icons.credit_card,
          ),
          PlaceholderSection(
            title: '银行卡列表占位',
            description: '下一阶段会支持银行卡信息、本期账单日、还款日和提醒规则。',
            icon: Icons.account_balance,
          ),
        ],
      ),
    );
  }
}
