import 'dart:async';

import 'package:get/get.dart';
import '../../../../../models/conversations/web_conversation.dart';
import '../../../../../models/helpers/database_helpers/web_conversation_db_helper.dart';
import '../../conversation_body/models/conversation_query.dart';
import 'conversation_query_controller.dart';

import '../../../../../models/enums.dart';

class ConversationFetchingController extends GetxController {
  //this enum is determines what should be displayed to the user in the list page
  Rx<ConversationListStatus> conversationListStatus =
      ConversationListStatus.isLoading.obs;
  //this list is used to display the conversations in the convos list on the right side of the page
  RxList<WebConversation> conversationsToDisplay = <WebConversation>[].obs;
  late Timer updateListTimer;

  @override
  void onInit() {
    Get.find<ConversationQueryController>().query.stream.listen((event) {
      executeQuery();
    });
    updateListTimer = Timer.periodic(10.seconds, (timer) {
      refreshQuery();
    });
    executeQuery();
    super.onInit();
  }

  Future<void> executeQuery() async {
    updateListTimer.cancel();
    conversationListStatus.value = ConversationListStatus.isLoading;
    conversationsToDisplay.value = await getQueryList();
    conversationListStatus.value = ConversationListStatus.hasConversations;
    reInitializeTimer();
  }

  reInitializeTimer() {
    if (updateListTimer.isActive) {
      return;
    }
    updateListTimer = Timer.periodic(4.seconds, (timer) {
      refreshQuery();
    });
  }

  refreshQuery() async {
    updateListTimer.cancel();
    conversationsToDisplay.value = await getQueryList();
    reInitializeTimer();
  }

  Future<List<WebConversation>> getQueryList() async {
    try {
      //TODO: add search query
      ConversationQuery query =
          Get.find<ConversationQueryController>().query.value;
      List<WebConversation> convos = [];
      switch (query.conversationStatus) {
        case ConversationStatus.open:
          {
            convos =
                await WebConversationDBHelper.instance.getOpenConversations();
            break;
          }
        case ConversationStatus.closed:
          {
            convos =
                await WebConversationDBHelper.instance.getClosedConversations();
            break;
          }
      }
      switch (query.studentSearchQueryType) {
        case StudentSearchQueryType.none:
          {
            return convos;
          }
        case StudentSearchQueryType.name:
          {
            return convos.where((element) {
              final String fullName =
                  '${element.studentName} ${element.fatherName} ${element.lastName}';
              return fullName.contains(query.studentNameOrId);
            }).toList();
          }
        case StudentSearchQueryType.publicRecordId:
          {
            int publicRecordId = int.parse(
              query.studentNameOrId.trim(),
            );
            return convos
                .where(
                  (element) => element.publicRecordId == publicRecordId,
                )
                .toList();
          }
      }
    } catch (e) {
      conversationListStatus.value = ConversationListStatus.hasError;
      return [];
    }
  }
}

enum ConversationListStatus {
  isLoading,
  hasConversations,
  hasError,
}
