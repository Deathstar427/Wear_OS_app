import 'dart:async';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:wear/wear.dart';
// ignore: unused_import
import 'package:wear_os_app/main.dart';
import 'new.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: NewPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(backgroundColor: Colors.black,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black),
      themeMode: ThemeMode.dark,
    );
  }
}
