import 'package:block_base/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors.dart';
import '../constants/inpu_border_consts.dart';
import '../theme/app_text_styles.dart';
import 'phone_field/country_picker_dialog.dart';
import 'phone_field/intl_phone_field.dart';


customPhoneField(
    context,{
      required title,
      Function? onPressed,
      var labelText,
      final FormFieldSetter<String>? onSaved,
      final String? hintText,
      final bool obscureText = false,
      final FormFieldValidator<String>? validator,
      final keyboardType,
      var textInputAction = TextInputAction.next,
      final border,
      final minLines,
      final controller,
      final maxLines,
      final bool enabled = true,
      final onChanged,
      final onSave,
      final onSubmit,
      var prefix,
      var prefixText,
      var maxLength,
      final focusNode,
    }) {
  return IntlPhoneField(
    controller: controller,
    pickerDialogStyle: PickerDialogStyle(backgroundColor: Colors.white),
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
    ],
    style:AppTextStyles.body1,
    decoration: InputDecoration(
      hintStyle: AppTextStyles.body2.copyWith(color: Colors.grey),
      labelStyle: AppTextStyles.h3.copyWith(color: Colors.grey),
      errorStyle: AppTextStyles.caption.copyWith(color: Colors.red),
      labelText: labelText,
      hintText: hintText,
      prefix: prefix,
      counterText: "",
      prefixText: prefixText,
      contentPadding: EdgeInsets.symmetric(vertical: 12.5.h, horizontal: 15.w),
      filled: true,
      fillColor: kTextFieldColor,
      border: InputBorderConsts.focusedBorder,
      enabledBorder: InputBorderConsts.border,
      disabledBorder: InputBorderConsts.disableBorder,
      focusedBorder: InputBorderConsts.focusedBorder,
      errorBorder: InputBorderConsts.errorBorder,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
    ),
    keyboardType: TextInputType.number,
    textInputAction: TextInputAction.done,
    initialCountryCode: 'PK',
    showCountryFlag: true,
    disableLengthCheck: false,
    invalidNumberMessage: 'invalid_mobile_number'.trans(context),
    searchText: 'search_country'.trans(context),
    showDropdownIcon: true,
    autofocus: false,
    obscureText: obscureText,
    cursorColor: kPrimaryColor,
    // maxLines: maxLines,
    enabled: enabled,
    dropdownTextStyle: AppTextStyles.body1,
    dropdownIcon: Icon(Icons.keyboard_arrow_down, color: kPrimaryColor),
    onChanged:  onChanged,
    onSaved: onSave,
    onSubmitted: onSubmit,
  );
}