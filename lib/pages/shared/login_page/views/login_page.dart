import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../configs/fonts.dart';
import '../../../../tools/ui_tools/labeled_widget.dart';
import '../controllers/login_page_controller.dart';
import '../../../../tools/ui_tools/text_fields.dart';

import '../../../../configs/assets.dart';
import '../../../../tools/ui_tools/buttons.dart';
import '../../../../tools/ui_tools/ui_tools.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Get.theme;
    final ColorScheme colorScheme = themeData.colorScheme;
    LoginPageController loginPageController = Get.find();
    return Scaffold(
      body: Center(
        child: Container(
          height: 590.h,
          width: 866.w,
          decoration: BoxDecoration(
            color: colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(27),
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withOpacity(.05),
                offset: const Offset(0, 30),
                blurRadius: 60,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      GlobalAssets.appLogoPath,
                      height: 198.h,
                      width: 198.h,
                    ),
                    const AddVerticalSpacing(value: 60),
                    Text(
                      'قلم و نور',
                      style: ProjectFonts.displayMedium(),
                    )
                  ],
                ),
              ),
              Container(
                width: 486.w,
                padding: EdgeInsets.symmetric(horizontal: 72.w),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(27.sp),
                    bottomLeft: Radius.circular(27.sp),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabeledWidget(
                      label: 'اسم المستخدم',
                      labelTextStyle: ProjectFonts.titleMedium()
                          .copyWith(color: colorScheme.onPrimary),
                      child: HintedTextField(
                        hintText: '',
                        controller: loginPageController.userNameField,
                        fillColor: const Color(0xFFBACCE2),
                      ),
                    ),
                    AddVerticalSpacing(value: 25.h),
                    LabeledWidget(
                      label: 'كلمة السر',
                      labelTextStyle: ProjectFonts.titleMedium()
                          .copyWith(color: colorScheme.onPrimary),
                      child: Obx(
                        () => Stack(
                          children: [
                            HintedTextField(
                              hintText: '',
                              controller: loginPageController.passwordField,
                              fillColor: const Color(0xFFBACCE2),
                              obscureText:
                                  loginPageController.obscureText.value,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                end: 22.w,
                                top: 17.h,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                  onTap: () =>
                                      loginPageController.toggleObscureText(),
                                  child: Icon(
                                    loginPageController.obscureText.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    AddVerticalSpacing(value: 50.h),
                    CustomFilledButton(
                      child: 'تسجيل الدخول',
                      labelColor: colorScheme.primary,
                      onTap: () => loginPageController.login(),
                      backgroundColor: colorScheme.onPrimary,
                      buttonStatus: loginPageController.loginButtonStatus,
                      loadingColor: colorScheme.primary,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
