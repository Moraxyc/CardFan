import 'package:flutter/material.dart';

import '../../shared/widgets/placeholder_section.dart';
import '../../shared/widgets/status_card.dart';

class SimCardsPage extends StatelessWidget {
  const SimCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIM 卡'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: const [
          StatusCard(
            title: '主力号码',
            subtitle: '运营商：中国移动｜套餐日：每月 10 日',
            statusText: '占位',
            level: StatusLevel.normal,
            icon: Icons.sim_card,
          ),
          PlaceholderSection(
            title: 'SIM 卡列表占位',
            description: '下一阶段会接入本地数据库，支持新增、编辑、删除 SIM 卡。',
            icon: Icons.add_card,
          ),
        ],
      ),
    );
  }
}
