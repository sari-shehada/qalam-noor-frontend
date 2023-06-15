import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../models/medical/student_vaccines_info.dart';
import '../../../../../../../tools/logic_tools/datetime_helper.dart';

import '../../../../../../../configs/fonts.dart';
import '../../../../../../../tools/ui_tools/ui_tools.dart';

class VaccinesInfoDialog extends StatelessWidget {
  const VaccinesInfoDialog({super.key, required this.list});
  final List<StudentVaccineInfo> list;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(15.r),
        child: Container(
          width: 600.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Colors.transparent,
          ),
          padding: EdgeInsetsDirectional.only(
              start: 30.w, end: 30.w, top: 20.h, bottom: 25.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "اللقاحات المأخوذة",
                style: ProjectFonts.headlineMedium(),
              ),
              AddVerticalSpacing(value: 15.h),
              SizedBox(
                height: 350.h,
                width: 300.w,
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    if (list.isEmpty) {
                      return Text(
                        "الطالب لم يأخذ أي لقاح سابقا",
                        style: ProjectFonts.bodyMedium(),
                      );
                    }
                    return Container(
                      padding: EdgeInsets.only(bottom: 10.h),
                      margin: EdgeInsets.only(bottom: 15.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 20.h),
                            blurRadius: 12,
                            color: colorScheme.primary.withOpacity(.09),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            list[index].vaccineName,
                            style: ProjectFonts.headlineSmall(),
                          ),
                          AddVerticalSpacing(value: 10.h),
                          Text(
                            DateTimeHelper.getDateWithoutTime(
                                list[index].shotDate),
                          ),
                          AddVerticalSpacing(value: 10.h),
                          Text(
                            list[index].note ?? "لايوجد ملاحظات",
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}