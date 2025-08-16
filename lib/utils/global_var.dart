import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../core/language/language_loader.dart';

var box;
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await LanguageLoader.init();
  box = await Hive.openBox('tiffo');
}