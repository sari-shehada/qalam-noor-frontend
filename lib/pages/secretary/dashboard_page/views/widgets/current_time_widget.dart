import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../configs/fonts.dart';
import '../../controllers/secretary_dashboard_controller.dart';
import '../../../../../tools/logic_tools/datetime_helper.dart';
import '../../../../../tools/ui_tools/ui_tools.dart';
import 'package:intl/intl.dart' as intl;

class CurrentTimeWidget extends GetView<SecretaryDashboardController> {
  const CurrentTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String time = intl.DateFormat.jm().format(controller.serverTime.value!);
    String timeOfDay = '${time[time.length - 2]}${time[time.length - 1]}';
    time = time.replaceAll(RegExp('[A-Z]'), '');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Text(
              '$time $timeOfDay',
              style: ProjectFonts.displayMedium().copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          AddVerticalSpacing(value: 20.h),
          Text(
            DateTimeHelper.getDateWithoutTime(controller.serverTime.value!),
            style: ProjectFonts.headlineMedium().copyWith(
              color: Get.theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
