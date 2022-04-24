import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mukh/AppConstants/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mukh/utils/storeAccountDetails.dart';

Future<int> updateDoctorPersonalInfo(
    BuildContext context,
    String firstName,
    String lastName,
    String type,
    String email,
    String regId,
    String id,
    String primaryPhone,
    String alternatePhone,
    String gender,
    String city) async {
  print(alternatePhone);
  final storage = new FlutterSecureStorage();
  String token = await storage.read(key: 'token') ?? '';
  final response = await http.post(
    Uri.parse(Constant.baseUrl + 'api/doctors/$id/personalDetails'),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer $token"
    },
    encoding: Encoding.getByName('utf-8'),
    body: {
      "_method": "PATCH",
      "first_name": firstName,
      "last_name": lastName,
      "type": type,
      "email": email,
      "primary_phone": primaryPhone,
      "alt_phone": alternatePhone,
      "gender": gender,
      "registration_id": regId,
      "city": city
    },
  );

  if (response.statusCode == 200) {
    var result = json.decode(response.body);
    await Account.instance.updateAccountDetails(result);
    // await Account.instance.storeAccountDetails(result['user']);
    return response.statusCode;
  } else {
    print(response.body);
    return response.statusCode;
  }
}
