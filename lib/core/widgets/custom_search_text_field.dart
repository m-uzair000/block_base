import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:searchfield/searchfield.dart';
import '../constants/colors.dart';
import '../constants/inpu_border_consts.dart';
import '../theme/app_text_styles.dart';

Widget CustomSearchTextField(
    BuildContext context, {
      required String title,
      VoidCallback? onPressed,
      String? labelText,
      Widget? suffix,
      FormFieldSetter<String>? onSaved,
      Widget? prefixIcon,
      Widget? suffixIcon,
      String? hintText,
      bool obscureText = false,
      FormFieldValidator<String>? validator,
      TextInputType? keyboardType,
      TextInputAction textInputAction = TextInputAction.next,
      InputBorder? border,
      int? minLines,
      TextEditingController? controller,
      int? maxLines,
      bool readOnly = false,
      bool enabled = true,
      TextStyle? style,
      ValueChanged<String>? onChanged,
      ValueChanged<String>? onSubmit,
      List<TextInputFormatter>? inputFormatters,
      Widget? prefix,
      String? prefixText,
      int? maxLength,
      bool showBorder = false,
      FocusNode? focusNode,
      required List<String> items,
    }) {
  return Column(
    children: [
      SearchField(
        controller: controller,
        validator: validator,
        suggestions: items.map((item) => SearchFieldListItem(item)).toList(),
        hint: hintText ?? "Search...",
        searchInputDecoration: SearchInputDecoration(
          hintStyle: AppTextStyles.body2.copyWith(color: Colors.grey),
          labelStyle: AppTextStyles.h3.copyWith(color: Colors.grey),
          errorStyle: AppTextStyles.caption.copyWith(color: Colors.red),
          labelText: labelText,
          hintText: hintText,
          suffix: suffix,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefix: prefix,
          counterText: "",
          prefixText: prefixText,
          contentPadding: EdgeInsets.symmetric(vertical: 12.5.h, horizontal: 15.w),
          filled: true,
          fillColor: kTextFieldColor,
          border: showBorder ? InputBorderConsts.focusedBorder : InputBorderConsts.focusedBorder,
          enabledBorder: InputBorderConsts.border,
          disabledBorder: InputBorderConsts.disableBorder,
          focusedBorder: InputBorderConsts.focusedBorder,
          errorBorder: InputBorderConsts.errorBorder,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        onSubmit: onSubmit,
        textInputAction: TextInputAction.done,
        itemHeight: 50,
      ),
    ],
  );
}
