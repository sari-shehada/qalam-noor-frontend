import 'package:get/get.dart';

import '../../../controllers/navigation_controller.dart';
import '../../../to_be_disposed/methods/dummy_methods.dart';
import '../../../models/agendas/employee.dart';
import '../../../models/shared_prefs_helper.dart';

class LoaderController extends GetxController {
  Future<void> loadApplication() async {
    if (!await SharedPrefsHelper.instance.getLoginStatus()) {
      NavigationController.toLoginPage();
      return;
    }
    //TODO: Add getting the job title as well as other info about the employee and navigating accordingly

    //TODO: Refactor the identity model
    Employee employee = await getEmployeeCredentials('11');
    NavigationController.toDashboard(employee);
    return;
  }
}
