import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/widget_controllers/student_basic_medical_info_sub_widget_controller.dart';
import '../../../../../../../tools/ui_tools/text_fields.dart';
import '../../../../../../../tools/ui_tools/ui_tools.dart';

import '../../../../../../../tools/ui_tools/labeled_widget.dart';

class StudentBasicMedicalInfoSubWidget extends StatelessWidget {
  const StudentBasicMedicalInfoSubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    StudentBasicMedicalInfoSubWidgetController controller =
        Get.put(StudentBasicMedicalInfoSubWidgetController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // shrinkWrap: true,
        children: [
          LabeledWidget(
            label: 'الطول (بالسنتيمتر)',
            child: Obx(
              () => HintedTextField(
                fillColor: controller.studentHeightController.fillColor.value,
                hintText: '',
                controller: controller.studentHeightController.controller,
              ),
            ),
          ),
          AddVerticalSpacing(value: 20.h),
          LabeledWidget(
            label: 'الوزن (بالكيلوغرام)',
            child: Obx(
              () => HintedTextField(
                fillColor: controller.studentWeightController.fillColor.value,
                hintText: '',
                controller: controller.studentWeightController.controller,
              ),
            ),
          ),
          // AddVerticalSpacing(value: 20.h),
          // LabeledWidget(
          //   label: 'زمرة الدم',
          //   child: HintedTextField(
          //     hintText: '',
          //     //TODO:
          //     controller: TextEditingController(),
          //   ),
          // ),
          // AddVerticalSpacing(value: 20.h),
          // LabeledWidget(
          //   label: 'عامل الارتصاص',
          //   child: HintedTextField(
          //     hintText: '',
          //     //TODO:
          //     controller: TextEditingController(),
          //   ),
          // ),
          AddVerticalSpacing(value: 80.h),
        ],
      ),
    );
  }
}
