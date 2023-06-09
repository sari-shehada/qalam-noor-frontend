import 'package:get/get.dart';
import 'account_controller.dart';
import '../models/helpers/destinations_helper.dart';
import '../pages/secretary/employees_management_page/add_employee_page/controllers/add_employee_controller.dart';
import '../pages/secretary/employees_management_page/add_employee_page/views/add_employee_page.dart';
import '../pages/secretary/medicals_management_page/illnesses_management_subpage/controllers/illness_management_controller.dart';
import '../pages/secretary/medicals_management_page/illnesses_management_subpage/views/illnesses_management_page.dart';
import '../pages/secretary/students_management_page/new_student_registration/main_page/controllers/new_student_registration_bindings.dart';
import '../pages/secretary/medicals_management_page/psychological_statuses_management_subpage/controllers/psychological_statuses_management_controller.dart';
import '../pages/shared/account_settings_page/controllers/settings_page_controller.dart';
import '../pages/shared/account_settings_page/views/settings_page.dart';
import '../pages/secretary/medicals_management_page/vaccines_management_subpage/views/vaccines_management_page.dart';
import '../tools/dialogs_services/snack_bar_service.dart';
import '../pages/secretary/students_management_page/new_student_registration/main_page/views/new_student_registration_page.dart';
import '../pages/secretary/medicals_management_page/psychological_statuses_management_subpage/views/psychological_statuses_management_page.dart';

import '../pages/shared/navigation_page/controllers/navigation_bindings.dart';
import '../pages/shared/navigation_page/views/navigation_page.dart';
import '../pages/shared/login_page/views/login_page.dart';

import '../pages/shared/login_page/controllers/login_page_bindings.dart';
import '../pages/secretary/medicals_management_page/vaccines_management_subpage/controllers/vaccines_management_controller.dart';

class NavigationController {
  static void toLoginPage() {
    Get.offAll(
      () => const LoginPage(),
      binding: LoginPageBindings(),
      routeName: 'login',
      transition: Transition.fadeIn,
      duration: const Duration(milliseconds: 800),
    );
  }

  static void toDashboard() {
    NavigationBindings navigationBinding = DestinationsHelper.getDestinations(
      Get.find<AccountController>().jobTitle.name,
    );
    Get.offAll(
      () => const NavigationPage(),
      routeName: 'dashboard',
      binding: navigationBinding,
      transition: Transition.fadeIn,
      duration: const Duration(milliseconds: 600),
    );
  }

  static void toVaccinesManagementPage() {
    Get.to(
      () => const VaccinesManagementPage(),
      binding: BindingsBuilder.put(
        () => VaccinesManagementController(),
      ),
    );
  }

  static void toIllnessesManagementPage() {
    Get.to(
      () => const IllnessesManagementPage(),
      binding: BindingsBuilder.put(
        () => IllnessesManagementController(),
      ),
    );
  }

  static void toPsychologicalStatusesManagementPage() {
    Get.to(
      () => const PsychologicalStatusesManagementPage(),
      binding: BindingsBuilder.put(
        () => PsychologicalStatusesManagementController(),
      ),
    );
  }

  static void toAddNewStudentPage() async {
    var result = await Get.to(
      () => const NewStudentRegistrationPage(),
      binding: NewStudentRegistrationBindings(),
    );
    if (result == true) {
      SnackBarService.showSuccessSnackBar(
          title: 'تمت العملية بنجاح', message: 'تمت إضافة طالب جديد');
    }
  }

  static Future<bool> toAddNewEmployeePage() async {
    var result = await Get.to(
      () => const AddEmployeePage(),
      binding: BindingsBuilder.put(() => AddEmployeeController()),
    );
    if (result == true) {
      SnackBarService.showSuccessSnackBar(
        title: 'تمت العملية بنجاح',
        message: 'تمت إضافة موظف جديد',
      );
      return true;
    }
    return false;
  }

  static toSettingsPage() {
    AccountController accountController = Get.find<AccountController>();
    Get.to(
      () => const SettingsPage(),
      binding: BindingsBuilder.put(
        () => SettingsPageController(
          employee: accountController.employee.obs,
          jobTitle: accountController.jobTitle,
        ),
      ),
    );
  }
}
