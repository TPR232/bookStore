import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/color_constants.dart';
import '../../../../shared/constants/string_constants.dart';
import '../../../../shared/widgets/common_outline_button.dart';
import '../login_controller.dart';

class LoginButton extends GetView<LoginController> {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonOutlineButton(
          onPressed: () {
            if (controller.loginKey.currentState!.validate()) {
              //call login method
              print("Login");
            }
          },
          text: StringConstant.loginText,
          fontSize: 14,
          width: Get.width,
          fontWeight: FontWeight.w600,
          textColor: ColorConstants.white,
          backgroundColor: ColorConstants.signUpColor,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}
