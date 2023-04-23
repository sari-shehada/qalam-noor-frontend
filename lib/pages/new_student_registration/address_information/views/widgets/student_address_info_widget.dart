import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kalam_noor/configs/fonts.dart';
import 'package:kalam_noor/tools/ui_tools/buttons.dart';
import 'package:kalam_noor/tools/ui_tools/ui_tools.dart';

import '../../../../../to_be_disposed/new_student_registration/student_information/views/new_student_registration_page.dart';
import '../../controllers/student_address_info_controller.dart';

class StudentAddressInfoWidget extends StatelessWidget {
  const StudentAddressInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    StudentAddressInfoController controller =
        Get.put(StudentAddressInfoController());
    return LabeledWidget(
      label: 'عنوان الطالب',
      labelTextStyle: Get.theme.textTheme.headlineMedium,
      child: Obx(
        () => controller.addressInfo.value == null
            ? Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: CustomTintedButton(
                    onTap: () => controller.selectStudentAddress(),
                    child: 'تحديد عنوان الطالب',
                  ),
                ),
              )
            : Expanded(
                child: Column(
                  children: [
                    AddVerticalSpacing(value: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'المدينة',
                          style: ProjectFonts.titleMedium(),
                        ),
                        Text(
                          controller.addressInfo.value!.city.name,
                          style: ProjectFonts.titleMedium().copyWith(
                            color: Get.theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    AddVerticalSpacing(value: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('المنطقة', style: ProjectFonts.titleMedium()),
                        Text(
                          controller.addressInfo.value!.area.name,
                          style: ProjectFonts.titleMedium().copyWith(
                            color: Get.theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    AddVerticalSpacing(value: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'العنوان',
                          style: ProjectFonts.titleMedium(),
                        ),
                        Text(
                          controller.addressInfo.value!.address.name,
                          style: ProjectFonts.titleMedium().copyWith(
                            color: Get.theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    CustomTintedButton(
                      onTap: () => controller.selectStudentAddress(),
                      child: 'إعادة تحديد العنوان',
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
