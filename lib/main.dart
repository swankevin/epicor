import 'package:epicor/view/signin_screen.dart';
import 'package:epicor/view/ud01/ud01_screen.dart';
import 'package:epicor/view/ud01/ud01add_screen.dart';
import 'package:epicor/view/ud01/ud01edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInScreen(),
      getPages: [
        GetPage(name: '/Home', page: () => UD01Screen()),
        GetPage(name: '/Add', page: () => UD01AddScreen()),
        GetPage(name: '/Edit', page: () => UD01EditScreen()),
      ],
    );
  }
}
