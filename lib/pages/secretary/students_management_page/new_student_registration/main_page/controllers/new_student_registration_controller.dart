import 'dart:developer';

import 'package:get/get.dart';
import '../../address_information/controllers/student_address_info_controller.dart';
import '../../enrolled_class_information/controllers/student_enrolled_class_info_widget_controller.dart';
import '../../family_information/controllers/student_family_info_controller.dart';
import '../../medical_information/controllers/student_medical_info_controller.dart';
import '../../personal_information/controllers/student_personal_info_controller.dart';
import '../../personal_information/models/student_registration_info.dart';
import '../../previous_school_information/controllers/add_student_previous_school_info_widget_controller.dart';
import '../../../../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../../../../tools/ui_tools/buttons.dart';

import '../../../../../../models/helpers/database_helpers/students_db_helper.dart';

class NewStudentRegistrationController extends GetxController {
  Rx<CustomButtonStatus> buttonStatus = CustomButtonStatus.enabled.obs;

  Future<void> registerStudent() async {
    buttonStatus.value = CustomButtonStatus.processing;
    try {
      if (!Get.find<StudentPersonalInfoController>().validateFields() ||
          !Get.find<StudentEnrolledClassInfoController>().validateFields()) {
        return;
      }
      final StudentRegistrationInfo registrationInfo = StudentRegistrationInfo(
        personalInfo:
            Get.find<StudentPersonalInfoController>().encapsulateData(),
        familyInfo: Get.find<StudentFamilyInfoController>().familyInfo.value!,
        medicalInfo:
            Get.find<StudentMedicalInfoController>().medicalInfo.value!,
        address:
            Get.find<StudentAddressInfoController>().addressInfo.value!.address,
        studentPreviousSchool:
            Get.find<StudentPreviousSchoolInfoController>().encapsulateData(),
        enrolledClass:
            Get.find<StudentEnrolledClassInfoController>().enrolledClass.value!,
      );
      await StudentsDBHelper.instance
          .registerNewStudent(registrationInfo: registrationInfo);
      Get.back(result: true);
    } catch (e) {
      log(e.toString());
      SnackBarService.showErrorSnackBar(
        title: 'حدث خطأ',
        message: e.toString(),
      );
    } finally {
      buttonStatus.value = CustomButtonStatus.enabled;
    }
  }
}
