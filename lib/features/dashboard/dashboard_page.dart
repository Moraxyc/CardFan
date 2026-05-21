import 'package:flutter/material.dart';

import '../../shared/widgets/status_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首页'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: const [
          StatusCard(
            title: '中国移动 SIM 卡',
            subtitle: '套餐续费日：每月 10 日',
            statusText: '3 天后',
            level: StatusLevel.warning,
            icon: Icons.sim_card,
          ),
          StatusCard(
            title: '招商银行信用卡',
            subtitle: '还款日：每月 18 日',
            statusText: '即将到期',
            level: StatusLevel.danger,
            icon: Icons.credit_card,
          ),
          StatusCard(
            title: '本月账单',
            subtitle: '当前仅展示占位数据',
            statusText: '正常',
            level: StatusLevel.normal,
            icon: Icons.receipt_long,
          ),
        ],
      ),
    );
  }
}
