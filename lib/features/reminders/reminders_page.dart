import 'package:flutter/material.dart';

import '../../shared/widgets/placeholder_section.dart';
import '../../shared/widgets/status_card.dart';

class RemindersPage extends StatelessWidget {
  const RemindersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('提醒'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: const [
          StatusCard(
            title: '信用卡还款提醒',
            subtitle: '提前 3 天提醒',
            statusText: '未开启',
            level: StatusLevel.warning,
            icon: Icons.notifications_active,
          ),
          PlaceholderSection(
            title: '提醒页占位',
            description: '后续会接入本地通知，并根据账单日、还款日自动生成提醒。',
            icon: Icons.alarm,
          ),
        ],
      ),
    );
  }
}
