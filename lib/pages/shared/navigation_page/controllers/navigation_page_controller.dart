import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../models/navigation_rail_destination_card.dart';

class NavigationPageController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  RxDouble railWidth =
      DashboardControllerConstants.navigationRailCollapsedWidth.obs;
  RxInt selectedIndex = (0).obs;
  RxDouble elementsOpacity = 0.0.obs;
  final List<NavigationRailDestinationCard> dashboardDestinations;
  final bool hasMiddleSection;
  final bool hasBottomSection;

  NavigationPageController({
    required this.dashboardDestinations,
    required this.hasMiddleSection,
    required this.hasBottomSection,
  }) {
    tabController =
        TabController(length: dashboardDestinations.length, vsync: this);
  }

  void expandContainer() {
    railWidth.value = DashboardControllerConstants.navigationRailExpandedWidth;
    elementsOpacity.value = 1;
  }

  void collapseContainer() {
    railWidth.value = DashboardControllerConstants.navigationRailCollapsedWidth;
    elementsOpacity.value = 0;
  }

  void switchToPage(int pageIndex) {
    selectedIndex.value = pageIndex;
    tabController.animateTo(pageIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInCubic);
  }
}

class DashboardControllerConstants {
  static double get navigationRailCollapsedWidth => 130.0.w;
  static double get navigationRailExpandedWidth => 346.0.w;
  static Duration get railAnimationDuration =>
      const Duration(milliseconds: 600);
}
