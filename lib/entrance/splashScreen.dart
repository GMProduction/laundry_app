import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/text/genText.dart';
import 'controller/splashScreenController.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Center(
              child: Image.asset("assets/images/logo_laundry.png", height: 50,)
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GenText(
                      "Laundry Apps v.1", color: Colors.grey,
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

