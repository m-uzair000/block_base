import 'package:flutter/material.dart';
import 'app.dart';
import 'utils/global_var.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

