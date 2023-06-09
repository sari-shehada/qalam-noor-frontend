import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../tools/ui_tools/buttons.dart';
import '../../../../../../tools/ui_tools/labeled_widget.dart';
import '../../../../../../tools/ui_tools/text_fields.dart';
import '../../../../../../tools/ui_tools/ui_tools.dart';
import '../../controllers/dialog_controllers/add_or_edit_classroom_dialog_controller.dart';

class AddOrEditClassroomDialog extends StatelessWidget {
  const AddOrEditClassroomDialog({super.key, this.argument});
  final dynamic argument;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final TextTheme textTheme = themeData.textTheme;
    AddOrEditClassroomDialogController controller = Get.put(
      AddOrEditClassroomDialogController(argument: argument),
    );
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
              Obx(
                () {
                  return Text(
                    controller.isEditMode.value == false
                        ? 'إضافة شعبة'
                        : 'تعديل معلومات الشعبة',
                    style: textTheme.headlineMedium,
                  );
                },
              ),
              AddVerticalSpacing(value: 40.h),
              LabeledWidget(
                label: 'اسم الشعبة',
                child: HintedTextField(
                  hintText: '',
                  controller: controller.classroomController,
                ),
              ),
              AddVerticalSpacing(value: 20.h),
              LabeledWidget(
                label: 'السعة الكلية',
                child: Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () {
                          return Slider(
                            min: 10.0,
                            max: 100.0,
                            divisions: 90,
                            value: controller.maxCapacity.value,
                            onChanged: (value) =>
                                controller.changeMaxCapacity(value),
                          );
                        },
                      ),
                    ),
                    AddHorizontalSpacing(value: 10.w),
                    SizedBox(
                      width: 80.w,
                      child: HintedTextField(
                        hintText: '',
                        controller: controller.maxCapacityController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AddVerticalSpacing(value: 30.h),
              Row(
                children: [
                  Expanded(
                    child: CustomOutlinedButton(
                      height: 50.h,
                      onTap: () => Get.back(),
                      child: 'إلغاء الإجراء',
                    ),
                  ),
                  AddHorizontalSpacing(value: 20.w),
                  Expanded(
                    child: Obx(
                      () => controller.isEditMode.value == false
                          ? CustomFilledButton(
                              buttonStatus: controller.buttonStatus,
                              height: 50.h,
                              onTap: () => controller.addClassroom(),
                              child: 'اضافة',
                            )
                          : CustomFilledButton(
                              buttonStatus: controller.buttonStatus,
                              height: 50.h,
                              onTap: () => controller.updateClassroomInfo(),
                              child: 'إجراء التعديل',
                            ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
