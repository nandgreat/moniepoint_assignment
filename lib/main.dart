import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moniepoint_assignment/bottom_dart.dart';
import 'package:moniepoint_assignment/home_screen.dart';
import 'package:moniepoint_assignment/styles/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var themeData = ThemeData(
      fontFamily: 'Poppins',
      primaryColor: primaryColor,
      selectedRowColor: secondaryColor,
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeData,
      home: const BottomNav(),
    );
  }
}