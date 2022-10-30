// ignore_for_file: depend_on_referenced_packages

import 'dart:ui';

import 'package:Kuchuk_Borom_Debbarma/Data/Theme/CustomTheme.dart';
import 'package:flutter/material.dart';

import 'pages/landing/PageLanding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      title: "Kuchuk Borom's Portfolio",
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.usingDark
          ? CustomTheme.darkTheme
          : CustomTheme.lightTheme,
      home: const PageLanding(),
    );
  }
}


class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}