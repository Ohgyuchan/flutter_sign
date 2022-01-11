import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sign/sign_in_page.dart';
import 'package:sign/sign_up_page.dart';
import 'package:sign/spalash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashPage()),
        GetPage(name: '/signIn', page: () => SignInPage()),
        GetPage(name: '/signUp', page: () => SignUpPage())
      ],
    );
  }
}
