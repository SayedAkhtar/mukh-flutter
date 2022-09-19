import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mukh/screen/consultant/landingPage.dart';
import 'package:mukh/utils/storeAccountDetails.dart';

class AuthController extends GetxController{

  void postLogin(String email, String pass) async {
    print(Uri.parse(Constant.baseUrl + 'api/login'));

    final response = await http.post(
      Uri.parse(Constant.baseUrl + 'api/login'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {"email": email, "password": pass},
    );

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      String token = result['token'];
      final storage = new FlutterSecureStorage();
      await storage.write(key: 'token', value: token);
      await Account.instance.storeAccountDetails(result['user']);
      Get.to(() => DoctorLandingPage());
    } else {
      var error = json.decode(response.body);
      Get.defaultDialog(title: 'Error',
      content: Text('${error['message']}')
      );
      return;
    }
  }
}