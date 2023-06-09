import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import '../../../../../../configs/fonts.dart';
import '../../../../../../models/enums.dart';
import '../../controllers/selected_conversation_controller.dart';
import 'chat_bubble.dart';
import '../../../../../../tools/ui_tools/buttons.dart';
import '../../../../../../tools/ui_tools/loader_widget.dart';
import '../../../../../../tools/ui_tools/text_fields.dart';
import '../../../../../../tools/ui_tools/ui_tools.dart';
import '../../../../../../tools/widgets/empty_item_widget.dart';
import '../../../../../../tools/widgets/error_loading_something_widget.dart';

import '../../controllers/conversation_body_controller.dart';
import '../../controllers/conversation_communication_controller.dart';

class ConversationListWidget extends StatelessWidget {
  const ConversationListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SelectedConversationController selectedConversationController = Get.find();
    ConversationBodyController conversationBodyController = Get.find();
    ConversationCommunicationController conversationCommunicationController =
        Get.find();
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        child: Container(
          height: 70.h,
          alignment: Alignment.center,
          child: selectedConversationController
                      .currentConversation.value!.status ==
                  ConversationStatus.closed
              ? const Text(
                  'تم انهاء هذه المحادثة، لا يمكنك الرد',
                )
              : Row(
                  children: [
                    Expanded(
                      child: HintedTextField(
                        hintText: 'نص الرسالة',
                        controller: conversationCommunicationController
                            .messageBodyController,
                      ),
                    ),
                    AddHorizontalSpacing(value: 20.w),
                    CustomFilledButton(
                      width: 80.w,
                      buttonStatus:
                          conversationCommunicationController.sendButtonStatus,
                      onTap: () => conversationCommunicationController
                          .sendMessageToCurrentConversation(),
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 90.h),
        child: Container(
          width: double.infinity,
          height: 70.h,
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.primaryContainer,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Builder(builder: (context) {
                return Obx(
                  () => Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${selectedConversationController.currentConversation.value!.studentName} ${selectedConversationController.currentConversation.value!.fatherName} ${selectedConversationController.currentConversation.value!.lastName}',
                            style: ProjectFonts.titleLarge().copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          PopupMenuButton(
                            onSelected: (item) =>
                                conversationCommunicationController
                                    .selectContextMenuItem(item),
                            padding: EdgeInsets.zero,
                            // initialValue: choices[_selection],
                            itemBuilder: (BuildContext context) {
                              return ConversationBodyContextMenuOptions.values
                                  .map(
                                    (e) => PopupMenuItem<
                                        ConversationBodyContextMenuOptions>(
                                      value: e,
                                      child: Text(
                                        conversationBodyContextMenuOptionsAsString[
                                            e]!,
                                      ),
                                    ),
                                  )
                                  .toList();
                            },
                          )
                        ],
                      ),
                      Center(
                        child: Text(
                          selectedConversationController
                              .currentConversation.value!.title,
                          style: ProjectFonts.titleLarge(),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Obx(
          () {
            switch (
                conversationBodyController.conversationMessagesStatus.value) {
              case ConversationMessagesStatus.isLoading:
                {
                  return const Center(
                    child: LoaderWidget(),
                  );
                }
              case ConversationMessagesStatus.hasMessages:
                {
                  return Obx(
                    () =>
                        conversationBodyController.conversationMessages.isEmpty
                            ? TweenAnimationBuilder(
                                duration: 600.milliseconds,
                                tween: Tween<double>(begin: 0.0, end: 1.0),
                                builder: (BuildContext context, dynamic value,
                                    Widget? child) {
                                  if (value == 1) {
                                    return const EmptyItemWidget(
                                      itemName: 'رسائل',
                                      iconData: FontAwesomeIcons.message,
                                    );
                                  }
                                  return const Center(
                                    child: LoaderWidget(),
                                  );
                                },
                              )
                            : ListView.builder(
                                controller: conversationCommunicationController
                                    .scrollController,
                                padding: EdgeInsets.symmetric(
                                  vertical: 15.h,
                                  horizontal: 20.w,
                                ),
                                itemCount: conversationBodyController
                                    .conversationMessages.length,
                                itemBuilder: (context, index) {
                                  return ChatBubble(
                                    message: conversationBodyController
                                        .conversationMessages[index],
                                  );
                                },
                              ),
                  );
                }
              case ConversationMessagesStatus.hasError:
                {
                  return const ErrorLoadingSomethingWidget(
                    somethingName: 'الرسائل',
                  );
                }
            }
          },
        ),
      ),
    );
  }
}


// conversationBodyController.conversationMessages.isEmpty
//                             ? const EmptyItemWidget(
//                                 itemName: 'رسائل',
//                                 iconData: FontAwesomeIcons.message,
//                               )

//  conversationBodyController.conversationMessages.isEmpty
//                             ? TweenAnimationBuilder(
//                                 duration: 600.milliseconds,
//                                 tween: Tween<double>(begin: 0.0, end: 1.0),
//                                 builder: (BuildContext context, dynamic value,
//                                     Widget? child) {
//                                   if (value == 1) {
//                                     return const EmptyItemWidget(
//                                       itemName: 'رسائل',
//                                       iconData: FontAwesomeIcons.message,
//                                     );
//                                   }
//                                   return const Center(
//                                     child: LoaderWidget(),
//                                   );
//                                 },
//                               )