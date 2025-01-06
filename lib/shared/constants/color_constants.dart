// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ColorConstants {
  static Color grey1 = Color(0xFFE0E0E0);
  static Color black1 = Color(0xFF888C8F);
  static Color black = Color(0xFF000000);
  static Color white = Color(0xFFFFFFFF);
  static Color kPrimary = Color(0xFF1577EA);
  static Color appGrayColor = Color(0xFF334155);
  static Color chatBubbleColor = Color(0xffF1F5F9);
  static Color chatTextFiledColor = Color(0xFFE2E8F0);
  static Color iconColor = Color(0xFFAAAAAA);
  static Color cursorColor = Color(0xFF1577EA);
  static Color appGreenColor = Color(0xFF2B6244);

  static Color redErrorColor = Color(0xFFFF4D4D);
  static Color unSelectedIconColor = Color(0xFFB5B5B5);

  static Color subtextColor = Color(0xFF64748B);
  static Color signUpColor = Color(0xFF1577EA);
  static Color hintTextColor = Color(0xFFCBD5E1);

  //login page
  static Color textColor = Color(0xFF2C2C2C);
  static Color googleButtonTextColor = Color(0xFF334155);

  static Color facebookButtonColor = Color(0xFF0757BF);
  static Color linkedlnButtonColor = Color(0xFF0063A1);

  static Color dividerColor = Color(0xFFE2E8F0);

  static Color orTextColor = Color(0xFF94A3B8);

  static Color formTextColor = Color(0xFF64748B);

  //signUp page
  static Color signupTextColor = Color(0xFF334155);
  static Color signupSubTextColor = Color(0xFF64748B);
  static Color signupFormHintTextColor = Color(0xFF64748B);
}

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

// Color fromHex(String hex) {
//   assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
//       'hex color must be #rrggbb or #rrggbbaa');

//   return Color(
//     int.parse(hex.substring(1), radix: 16) +
//         (hex.length == 7 ? 0xff000000 : 0x00000000),
//   );
// }
