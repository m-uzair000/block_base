import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../utils/global_var.dart';
import '../constants/colors.dart';
import '../constants/hive_keys.dart';
const String defaultAvatar =
    "https://firebasestorage.googleapis.com/v0/b/podcastapp-a181d.appspot.com/o/default%2Fdefault_avatar.png?alt=media&token=138b6c95-7e54-4ebe-8192-b5787b96b54e";

class BaseHelper {
  BaseHelper._();

  // static MDUser? user;

  /// Hide keyboard
  static void hideKeypad(BuildContext context) {
    FocusScope.of(context).unfocus();
  }


  static void showSnackBar(BuildContext context, String msg, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: color ?? kPrimaryColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // static const LatLng initPosition = LatLng(31.521332, 74.347752);

  static String stripePublishableKey =
      "pk_test_51OSco6FvvEIp28cvZpZBsWhiuYAyPq0R9E3d5Xrnvy598U2uonPpfplNL6pkqcM7XtVlNNrCEMWKe0cPDI3z5jhK00mqjmR8jk";

  static String getInitials(String? string, {int? limitTo = 2}) {
    if (string == null || string.isEmpty) return '';
    else if (string.contains(" ")) {
      var buffer = StringBuffer();
      var split = string.split(' ');
      for (var i = 0; i < (limitTo ?? split.length); i++) {
        buffer.write(split[i][0]);
      }
      return buffer.toString().toUpperCase();
    }
    return "";
  }

  static String selectedLanguage() {
    String language = box.get(HiveKeys.language, defaultValue: "");
    if (language.isEmpty) {
      language = 'en';
    }
    return language;
  }

  static String getLanguageTitle(String lang) {
    if (lang == 'en') return 'English';
    else if (lang == 'ur') return 'Urdu';
    return 'Unknown';
  }

  static Future<String?> selectDate(BuildContext context) async {
    final DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: kPrimaryColor,
            colorScheme: ColorScheme.light(primary: kPrimaryColor),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      return dateFormat.format(pickedDate);
    }
    return null;
  }

  // static void showNumberPicker(
  //     BuildContext context, int initialItem, Function(int) onSelectedItemChanged) {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: kBackgroundColor,
  //     builder: (_) => CustomNumberPicker(
  //       initialItem: initialItem,
  //       onSelectedItemChanged: onSelectedItemChanged,
  //     ),
  //   );
  // }

  // static void showDropdown(
  //     BuildContext context, {
  //       required List<String> items,
  //       required String title,
  //       required TextEditingController selected,
  //     }) {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     builder: (_) => Container(
  //       padding: EdgeInsets.all(16),
  //       decoration: BoxDecoration(
  //         color: kBackgroundColor,
  //         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //       ),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Text(title,
  //               style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.bold)),
  //           SizedBox(height: 20),
  //           SizedBox(
  //             height: 300.h,
  //             child: ListView.separated(
  //               itemCount: items.length,
  //               separatorBuilder: (_, __) => Divider(color: kAppbarBackgroundColor),
  //               itemBuilder: (context, index) => ListTile(
  //                 title: Text(items[index].firstLaterCapital()),
  //                 onTap: () {
  //                   selected.text = items[index].firstLaterCapital();
  //                   Navigator.pop(context);
  //                 },
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // static Future<File?> pickImage(ImageSource imageSource, {bool isProfile = false}) async {
  //   final picker = ImagePicker();
  //   final img = await picker.pickImage(source: imageSource, imageQuality: 50);
  //
  //   if (img != null) {
  //     CroppedFile? croppedFile = await ImageCropper().cropImage(
  //       sourcePath: img.path,
  //       maxWidth: 512,
  //       maxHeight: 512,
  //       aspectRatio: isProfile ? CropAspectRatio(ratioX: 1, ratioY: 1) : null,
  //       uiSettings: [
  //         if (Platform.isIOS)
  //           IOSUiSettings(title: 'Crop Image', aspectRatioLockEnabled: isProfile),
  //         if (Platform.isAndroid)
  //           AndroidUiSettings(toolbarTitle: 'Crop Image', lockAspectRatio: isProfile),
  //       ],
  //     );
  //     if (croppedFile != null) return File(croppedFile.path);
  //   }
  //   return null;
  // }

  // static Future<List<String>?> scanImage() async {
  //   final imagesPath = await CunningDocumentScanner.getPictures();
  //   if (imagesPath != null && imagesPath.isNotEmpty) {
  //     return imagesPath;
  //   }
  //   return null;
  // }

  // static Future<ImageSource?> showImagePickerDialog(BuildContext context) async {
  //   return await showModalBottomSheet<ImageSource>(
  //     context: context,
  //     builder: (_) => Container(
  //       padding: EdgeInsets.all(15),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
  //       ),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Text("Select image source",
  //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //           ListTile(
  //             leading: Icon(Icons.camera_alt_outlined, color: kPrimaryColor),
  //             title: Text("Take a photo"),
  //             onTap: () => Navigator.pop(context, ImageSource.camera),
  //           ),
  //           ListTile(
  //             leading: Icon(Icons.photo_library_outlined, color: kPrimaryColor),
  //             title: Text("Choose from gallery"),
  //             onTap: () => Navigator.pop(context, ImageSource.gallery),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
