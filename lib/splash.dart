import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:mukh/screen/consultant/landingPage.dart';

import 'screen/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  countDownTime() async {
    final storage = new FlutterSecureStorage();
    return Timer(
      Duration(seconds: 1),
      () async {
        String token = await storage.read(key: 'token') ?? '';
        print(token);
        if (token == '') {
          Get.off(() => LoginScreen());
        } else {
          Get.off(() => DoctorLandingPage());
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    countDownTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
