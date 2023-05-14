import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/school_inbox_page/controllers/school_inbox_controller.dart';

import 'school_inbox_tabbar_item.dart';

class SchoolInboxTabBar extends StatelessWidget {
  const SchoolInboxTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final SchoolInboxController controller = Get.find();
    return TabBar(
      controller: controller.tabController,
      tabs: [
        SchoolInboxTabBarItem(
          title: 'المحادثات المفتوحة',
          currentIndex: controller.pageIndex,
          itemIndex: 0,
        ),
        SchoolInboxTabBarItem(
          title: 'المحادثات المغلقة',
          currentIndex: controller.pageIndex,
          itemIndex: 1,
        ),
      ],
    );
  }
}
