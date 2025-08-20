import 'package:block_base/core/services/screen_config/screen_config_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/constants/inpu_border_consts.dart';
import '../core/theme/app_text_styles.dart';
import 'search_field.dart';

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
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SearchField<String>(
        hint: hintText ?? "Search...",
        controller: controller,
        focusNode: focusNode,
        onSearch: (query) async {
          return items
              .where((e) => e.toLowerCase().contains(query.toLowerCase()))
              .toList();
        },
        displayString: (item) => item,
        onSelected: (selected) {
          if (selected.isNotEmpty) {
            onSaved?.call(selected.first);
          }
        },
        obscureText: obscureText,
        minLines: minLines,
        maxLines: maxLines,
        readOnly: readOnly,
        enabled: enabled,
        style: style ?? AppTextStyles.body2,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        onSubmit: onSubmit,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        validator: validator,
        border: showBorder
            ? InputBorderConsts.focusedBorder
            : InputBorderConsts.border,
        maxLength: maxLength,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefix: prefix,
        suffix: suffix,
        labelText: labelText,
        prefixText: prefixText,
        contentPadding:
        EdgeInsets.symmetric(vertical: 12.5.h, horizontal: 15.w),
      ),
    ],
  );
}
