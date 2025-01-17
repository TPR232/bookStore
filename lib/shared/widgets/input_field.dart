import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

import '../constants/color_constants.dart';
import '../utils/match_utils.dart';

class InputTextField extends StatelessWidget {
  final bool? enable;
  final String? initialValue;
  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final Color? textColor;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final int? errorMaxLines;
  final FocusNode? focusNode;
  final int maxLines;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final EdgeInsets? contentPadding;
  final Function()? onTap;
  final TextInputAction? textInputAction;
  final String? errorText;
  final bool isSecure;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;
  final Color? borderColor;
  final Color? hintTextColor;
  final BorderRadius? borderRadius;
  final FontStyle? hintFontStyle;
  const InputTextField({
    super.key,
    this.initialValue,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.textColor,
    required this.controller,
    this.textInputType,
    this.errorMaxLines,
    this.maxLines = 1,
    this.maxLength,
    this.contentPadding,
    this.onTap,
    this.textInputAction,
    this.errorText,
    this.isSecure = false,
    this.enable = true,
    this.onChanged,
    this.inputFormatters,
    this.prefixText,
    this.focusNode,
    this.onFieldSubmitted,
    this.textCapitalization,
    this.borderColor,
    this.hintTextColor,
    this.borderRadius,
    this.hintFontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return _buildStackContainer();
  }

  _buildStackContainer() {
    return MediaQuery(
      data: MediaQuery.of(Get.context!)
          .copyWith(textScaler: TextScaler.linear(1.0)),
      child: TextFormField(
        inputFormatters: inputFormatters,
        enabled: enable,
        initialValue: initialValue,
        controller: controller,
        onTap: onTap,
        cursorColor: ColorConstants.cursorColor,
        cursorHeight: getSize(20),
        textAlignVertical: TextAlignVertical.center,
        keyboardType: textInputType ?? TextInputType.text,
        maxLines: maxLines,
        maxLength: maxLength,
        focusNode: focusNode,
        minLines: 1,
        obscureText: isSecure,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        autovalidateMode: AutovalidateMode.disabled,
        textInputAction: textInputAction ?? TextInputAction.next,
        onChanged: onChanged,
        style: TextStyle(
          debugLabel: labelText,
          fontFamily: 'PlusJakartaSans',
          letterSpacing: 0.5,
          color: ColorConstants.black,
          fontSize: getFontSize(16),
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          counterText: '',
          alignLabelWithHint: true,
          isDense: true,
          filled: true,
          labelText: labelText,
          errorText: errorText,
          focusColor: ColorConstants.white,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(
                vertical: getSize(14),
                horizontal: getSize(14),
              ),
          hintText: hintText,
          fillColor: ColorConstants.white,
          errorMaxLines: errorMaxLines ?? 1,
          errorStyle: TextStyle(
            backgroundColor: ColorConstants.white,
            fontSize: getFontSize(12),
            fontWeight: FontWeight.normal, fontFamily: 'PlusJakartaSans',
            letterSpacing: 0.5,

            //letterSpacing: Utils.getSize(0.5),
            color: ColorConstants.redErrorColor,
          ),
          //    prefixIconConstraints: BoxConstraints(maxHeight: getSize(50)),
          labelStyle: TextStyle(
            fontSize: getFontSize(12),
            fontWeight: FontWeight.normal, fontFamily: 'PlusJakartaSans',
            letterSpacing: 0.5,
            //letterSpacing: Utils.getSize(0.5),
            color: textColor ?? ColorConstants.black1,
          ),
          hintStyle: TextStyle(
            //  height: maxLines == 2 ? 2 : 0,
            //fontFamily: "Lexend Deca",
            fontSize: getFontSize(14), fontFamily: 'PlusJakartaSans',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            color: hintTextColor ?? ColorConstants.black1,
            fontStyle: hintFontStyle ?? FontStyle.normal,
          ),
          suffixIcon: suffixIcon,
          suffixIconConstraints: BoxConstraints(
            maxHeight: getSize(45),
            minWidth: getSize(40),
          ),
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(4),
            // borderSide: BorderSide(
            //   color: borderColor ?? const Color(0xFF1577EA),
            // ),
          ),
          // enabled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(4),
            borderSide: BorderSide(
              color: borderColor ?? const Color(0xFF1577EA),
            ),
          ),
        ),
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
      ),
    );
  }
}

InputTextField getTextField(
    {required String hintText,
    required TextEditingController controller,
    required String? Function(String?) validator,
    dynamic Function(String)? onChanged,
    Widget? suffix,
    bool isSecure = false,
    FocusNode? focusNode,
    Function(String)? onFieldSubmitted,
    TextInputAction? textInputAction,
    TextInputType? textInputType,
    TextCapitalization? textCapitalization}) {
  return InputTextField(
    controller: controller,
    hintText: hintText,
    validator: validator,
    onChanged: onChanged,
    suffixIcon: suffix,
    focusNode: focusNode,
    onFieldSubmitted: onFieldSubmitted,
    isSecure: isSecure,
    textCapitalization: textCapitalization,
    textInputAction: textInputAction ?? TextInputAction.next,
    textInputType: textInputType,
  );
}
