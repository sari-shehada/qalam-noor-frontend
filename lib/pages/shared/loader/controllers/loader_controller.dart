import 'package:get/get.dart';
import '../../../../controllers/account_controller.dart';
import '../../../../models/agendas/employee.dart';
import 'loader_page_animation_controller.dart';

import '../../../../controllers/navigation_controller.dart';
import '../../../../models/shared_prefs_helper.dart';

class LoaderController extends GetxController {
  Future<void> loadApplication() async {
    if (!await SharedPrefsHelper.instance.getLoginStatus()) {
      NavigationController.toLoginPage();
      return;
    }
    int employeeId = await SharedPrefsHelper.instance.getLoginData();
    final Employee employee = await Get.find<AccountController>()
        .getCredentials(employeeId: employeeId);
    await Future.delayed(500.milliseconds);
    await Get.find<LoaderPageAnimationController>()
        .animationController
        .forward();
    await Get.find<LoaderPageAnimationController>().welcomeUser(employee);
    // return;
    NavigationController.toDashboard();
    return;
  }
}
