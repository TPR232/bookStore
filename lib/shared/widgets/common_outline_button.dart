import 'package:book_portal/shared/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/color_constants.dart';
import '../utils/match_utils.dart';

class CommonOutlineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? textColor;
  final String? imagePath;
  final String? fontFamily;
  final Color? backgroundColor;
  final double? iconWidth;
  final double? iconHeight;
  final bool? socialButton;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  const CommonOutlineButton({
    super.key,
    required this.onPressed,
    this.width,
    this.height,
    required this.text,
    this.fontWeight,
    required this.fontSize,
    this.textColor,
    this.imagePath,
    this.fontFamily,
    this.backgroundColor,
    this.iconWidth,
    this.iconHeight,
    this.socialButton,
    this.borderRadius,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: width ?? Get.width,
        height: height ?? getSize(40),
        decoration: BoxDecoration(
          color: backgroundColor ?? ColorConstants.kPrimary,
          borderRadius: borderRadius ?? BorderRadius.circular(4),
          boxShadow: boxShadow ??
              [
                BoxShadow(
                  blurRadius: getSize(5),
                  offset: const Offset(1, 1),
                  color: ColorConstants.black.withOpacity(0.5),
                ),
              ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (socialButton ?? false)
              Image.asset(
                imagePath!,
                height: iconHeight,
                width: iconWidth,
              ),
            if (socialButton ?? false)
              SizedBox(
                width: getSize(8),
              ),
            CommonText(
              text: text,
              fontFamily: fontFamily ?? "PlusJakartaSans",
              fontSize: fontSize,
              fontWeight: fontWeight,
              textColor: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
