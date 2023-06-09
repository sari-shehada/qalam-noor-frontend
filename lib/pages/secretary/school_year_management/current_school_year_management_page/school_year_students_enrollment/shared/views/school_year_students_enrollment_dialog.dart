import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/shared/views/widgets/school_year_students_enrollment_tab_view_widget.dart';
import 'package:kalam_noor/pages/secretary/school_year_management/current_school_year_management_page/school_year_students_enrollment/shared/views/widgets/school_year_students_enrollment_sections_panel_widget.dart';
import '../../../../../../../configs/fonts.dart';
import '../../../../../../../configs/styles.dart';
import '../../../../../../../tools/ui_tools/ui_tools.dart';
import '../controllers/school_year_students_enrollment_dialog_primary_controller.dart';

class SchoolYearStudentsEnrollmentDialog extends StatelessWidget {
  const SchoolYearStudentsEnrollmentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
      SchoolYearStudentsEnrollmentDialogPrimaryController(),
    );
    final ColorScheme colorScheme = Get.theme.colorScheme;
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(GlobalStyles.globalBorderRadius),
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * .7,
            height: 850.h,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(GlobalStyles.globalBorderRadius),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 15.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 15.h),
                        blurRadius: 30,
                        color: colorScheme.shadow.withOpacity(.09),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.cancel,
                          size: 35.sp,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      AddHorizontalSpacing(value: 20.w),
                      Text(
                        'تسجيل طلاب جدد ضمن العام الدراسي',
                        style: ProjectFonts.titleLarge(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 4,
                        child:
                            SchoolYearStudentsEnrollmentSectionsPanelWidget(),
                      ),
                      VerticalDivider(
                        indent: 20.h,
                        endIndent: 20.h,
                        width: 0,
                      ),
                      const Expanded(
                        flex: 7,
                        child: SchoolYearStudentsEnrollmentTabViewWidget(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
