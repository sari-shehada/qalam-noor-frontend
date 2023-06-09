import 'package:get/get.dart';
import '../../../../../../../models/helpers/database_helpers/illnesses_db_helper.dart';
import '../../../../../../../models/medical/illness.dart';
import '../../../../../medicals_management_page/illnesses_management_subpage/views/dialogs/add_or_edit_illness_dialog.dart';

class StudentIllnessesInfoSubWidgetController extends GetxController {
  late Rx<Future<List<Illness>>> illnesses;
  RxList<Illness> selectedIllnesses = <Illness>[].obs;

  StudentIllnessesInfoSubWidgetController() {
    illnesses = getIllnesses().obs;
  }
  Future<List<Illness>> getIllnesses() async {
    return await IllnessesDBHelper.instance.getAll();
  }

  void selectIllness(Illness illness) {
    if (selectedIllnesses.contains(illness)) {
      selectedIllnesses.remove(illness);
    } else {
      selectedIllnesses.add(illness);
    }
  }

  Future<void> addNewIllness() async {
    var result = await Get.dialog(const AddOrEditIllnessDialog());
    if (result == true) {
      illnesses.value = getIllnesses();
    }
  }
}
