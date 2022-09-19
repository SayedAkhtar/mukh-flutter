import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/screen/patient/editScreens/updateNewMedicine.dart';
import 'package:mukh/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Sansation',
          appBarTheme: AppBarTheme(backgroundColor: Constant.mainColor)),
      home: SplashScreen(),
      // home: UpdateNewMedicine(),
    );
  }
}
