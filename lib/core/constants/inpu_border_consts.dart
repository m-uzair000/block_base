import 'package:flutter/material.dart';

import 'colors.dart';

class InputBorderConsts {
  static var border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: BorderSide(
      color: kAppbarPrimaryColor,
    ),
  );

  static var disableBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  );

  static var focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: BorderSide(
      color: kPrimaryColor,
      // color: kTextFieldColor,
    ),
  );

  static var errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: BorderSide(
      color: Colors.red,
    ),
  );
}
