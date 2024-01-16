import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:new_flix_2/consts/consts.dart';
import 'package:new_flix_2/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NEWFLIX APP',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
        fontFamily: regular,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
