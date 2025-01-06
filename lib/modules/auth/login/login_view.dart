import 'package:book_portal/modules/auth/login/login_controller.dart';
import 'package:book_portal/modules/auth/login/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../shared/constants/color_constants.dart';
import '../../../shared/widgets/common_text.dart';
import '../../../shared/constants/string_constants.dart';
import '../../../shared/utils/match_utils.dart';
import '../../../shared/widgets/input_field.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            left: getSize(40),
            right: getSize(40),
            top: getSize(8),
          ),
          child: Form(
            key: controller.loginKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  text: 'Log In',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: getSize(80),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: StringConstant.email,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    InputTextField(
                      controller: controller.emailController,
                      textInputType: TextInputType.emailAddress,
                      borderColor: ColorConstants.textColor,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return StringConstant.emailErrorText1;
                        } else if (!GetUtils.isEmail(value)) {
                          return StringConstant.emailErrorText2;
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(
                          RegExp(
                              r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
                        ),
                      ],
                      onChanged: (value) {
                        controller.email = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CommonText(
                      text: StringConstant.password,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                    InputTextField(
                      controller: controller.passController,
                      textInputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      borderColor: ColorConstants.textColor,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return StringConstant.passwordErrorText1;
                        } else if (value.length < 8) {
                          return StringConstant.passwordErrorText2;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        controller.pass = value;
                      },
                      errorMaxLines: 2,
                    ),
                    CommonText(
                      fontStyle: FontStyle.italic,
                      text: StringConstant.forgotPass,
                      textColor: ColorConstants.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                    ),
                    SizedBox(
                      height: getSize(20),
                    ),
                    LoginButton(),
                    SizedBox(
                      height: getSize(20),
                    ),
                  ],
                ),
                CommonText(
                  text: 'New User, Sign Up!',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
