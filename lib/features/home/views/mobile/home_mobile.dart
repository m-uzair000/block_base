import 'package:block_base/core/extensions/language_extensions.dart';
import 'package:block_base/core/services/screen_config/screen_config_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/language/language_bloc.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/loader/loader_helper.dart';
import '../../../../widgets/theme_toggle_button.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("home".trans(context)),
        centerTitle: true,
        actions: const [
          ThemeToggleButton(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: ElevatedButton(
                onPressed: () {
                  final currentLocale =
                      context.read<LanguageBloc>().state.locale;
                  if (currentLocale.languageCode == 'en') {
                    context
                        .read<LanguageBloc>()
                        .add(ChangeLanguage(const Locale('ur')));
                  } else {
                    context
                        .read<LanguageBloc>()
                        .add(ChangeLanguage(const Locale('en')));
                  }
                },
                child: Text("change_language".trans(context)),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: ElevatedButton(
                onPressed: () {
                  showLoader(context);
                  Future.delayed(const Duration(seconds: 3), () {
                    if (context.mounted) {
                      hideLoader(context);
                    }
                  });
                },
                child: const Text("Show Loader"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
