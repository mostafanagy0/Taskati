// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/thems.dart';
import 'package:taskati/splash.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<Task>('task');
  await Hive.openBox<bool>('mode');
  await Hive.openBox('user');
  Hive.registerAdapter(TaskAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<bool>('mode').listenable(),
      builder: (context, value, child) {
        bool darkMode = value.get('darkMode', defaultValue: false)!;
        return MaterialApp(
          themeMode: darkMode ? ThemeMode.light : ThemeMode.dark,
          darkTheme: darkThem,
          theme: ligthThem,
          debugShowCheckedModeBanner: false,
          home: const SplashView(),
        );
      },
    );
  }
}
