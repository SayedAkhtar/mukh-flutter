import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mukh/AppConstants/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'storeAccountDetails.dart';

// Future<int> checkSignup(BuildContext context, String email) async {
//
// }


Future<int> signup(BuildContext context, String email, String pass, String type,
    String firstName, String lastName) async {
  final response = await http.post(
    Uri.parse(Constant.baseUrl + 'api/register'),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    encoding: Encoding.getByName('utf-8'),
    body: {
      "email": email,
      "password": pass,
      "first_name": firstName,
      "last_name": lastName,
      "type": type
    },
  );
  print(response.body);
  if (response.statusCode == 201) {
    var result = json.decode(response.body);
    String token = result['token'];
    final storage = new FlutterSecureStorage();
    await storage.write(key: 'token', value: token);
    await Account.instance.storeAccountDetails(result['user']);
    return response.statusCode;
  } else {
    var errorMessage = json.decode(response.body);
    errorMessage = errorMessage["errors"];
    String emailError = "", passwordError = "";

    if (errorMessage["email"] != null) emailError = errorMessage["email"][0];

    if (errorMessage["password"] != null)
      passwordError = errorMessage["password"][0];

    Get.snackbar('Error', emailError + '\n' + passwordError,
        snackPosition: SnackPosition.BOTTOM);
    return response.statusCode;
  }
}
