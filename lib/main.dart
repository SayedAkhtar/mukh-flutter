import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/screen/LoginScreen.dart';
import 'package:mukh/screen/RegisterSelection.dart';
import 'package:mukh/screen/consultant/home.dart';
import 'package:mukh/screen/consultant/landingPage.dart';
import 'package:mukh/screen/consultant/profile.dart';
import 'package:mukh/screen/patient/addPatient.dart';
import 'package:mukh/screen/patient/editPatientDetails.dart';
import 'package:mukh/screen/patient/home.dart';
import 'package:mukh/screen/patient/profile.dart';

import 'screen/editPersonalInformation.dart';

void main() {
  runApp(const GetMaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Sansation',
          appBarTheme: AppBarTheme(backgroundColor: Constant.mainColor)),
      home: EditPersonalDetails(),
    );
  }
}
