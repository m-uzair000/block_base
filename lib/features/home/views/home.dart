import 'package:block_base/core/extensions/language_extensions.dart';
import 'package:block_base/core/services/screen_config/screen_config_extensions.dart';
import 'package:block_base/features/home/views/desktop/home_desktop.dart';
import 'package:block_base/features/home/views/mobile/home_mobile.dart';
import 'package:block_base/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'tab/home_tab.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = "/homePage";

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: HomeMobile(),
      tablet: HomeTab(),
      desktop: HomeDesktop(),
    );
  }
}
