import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 2500),
      (() async {
        Get.offNamed('/login');
      }),
    );
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Image.asset(
          'assets/gif/plu.gif',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
