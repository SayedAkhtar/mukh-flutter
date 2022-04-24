import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mukh/AppConstants/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mukh/utils/storeAccountDetails.dart';

Future<int> login(BuildContext context, String email, String pass) async {
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
    return response.statusCode;
  } else {
    return response.statusCode;
  }
}
