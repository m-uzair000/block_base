import 'package:block_base/core/services/screen_config/screen_config_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/constants/colors.dart';
import '../core/constants/inpu_border_consts.dart';
import '../core/theme/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? prefix;
  final String? prefixText;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final bool showBorder;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final TextStyle? style;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmit;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onPressed;

  const CustomTextFormField({
    Key? key,
    this.labelText,
    this.hintText,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.prefixText,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.showBorder = false,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.style,
    this.controller,
    this.focusNode,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.onSubmit,
    this.inputFormatters,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onPressed,
      focusNode: focusNode,
      maxLength: maxLength,
      keyboardType: keyboardType,
      onSaved: onSaved,
      readOnly: readOnly,
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      obscuringCharacter: '*',
      style: style ?? AppTextStyles.body1,
      controller: controller,
      validator: validator,
      autofocus: false,
      obscureText: obscureText,
      textInputAction: textInputAction,
      minLines: minLines ?? 1,
      cursorColor: kPrimaryColor,
      enabled: enabled,
      maxLines: maxLines ?? (minLines ?? 1),
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintStyle: AppTextStyles.body2.copyWith(color: Colors.grey),
        labelStyle: AppTextStyles.h3.copyWith(color: Colors.grey),
        errorStyle: AppTextStyles.caption.copyWith(color: Colors.red),
        labelText: labelText,
        hintText: hintText,
        suffix: suffix,
        isDense: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefix: prefix,
        counterText: "",
        prefixText: prefixText,
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        filled: true,
        fillColor: kTextFieldColor,
        border: showBorder ? InputBorderConsts.focusedBorder : InputBorder.none,
        enabledBorder: InputBorderConsts.border,
        disabledBorder: InputBorderConsts.disableBorder,
        focusedBorder: InputBorderConsts.focusedBorder,
        errorBorder: InputBorderConsts.errorBorder,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }
}
