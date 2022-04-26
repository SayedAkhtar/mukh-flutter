import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mukh/AppConstants/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mukh/utils/storeAccountDetails.dart';

import '../models/doctor.dart';

Future<Map> getOneDoctor(String id) async {
  var account = await Account.instance.getAccDetails();
  if (id == '') {
    id = ((account)[0]['_id'] as int).toString();
  }
  final storage = new FlutterSecureStorage();
  String token = await storage.read(key: 'token') ?? '';
  print(token);
  final response = await http.get(
    Uri.parse(Constant.baseUrl + 'api/doctors/${id.toString()}'),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer $token"
    },
  );

  if (response.statusCode == 200) {
    var doctorsData = json.decode(response.body);

    Doctor _doctor = Doctor(
        id: doctorsData["id"].toString(),
        firstName: doctorsData["first_name"].toString(),
        lastName: doctorsData["last_name"].toString(),
        email: doctorsData["email"].toString(),
        type: doctorsData["type"].toString(),
        primaryPhone: doctorsData["primary_phone"].toString(),
        alternatePhone: doctorsData["alt_phone"].toString(),
        city: doctorsData["city"].toString(),
        image: doctorsData["image"].toString(),
        regId: doctorsData["registration_id"].toString(),
        createdAt: doctorsData["created_at"].toString(),
        updatedAt: doctorsData["updated_at"].toString(),
        deletedAt: doctorsData["deleted_at"].toString(),
        accountVerifiedAt: doctorsData["account_verified_at"].toString(),
        emailVerifiedAt: doctorsData["email_verified_at"].toString(),
        gender: doctorsData["gender"].toString());

    return {
      "professional_details": doctorsData['professional_details'],
      "doctors_data": _doctor
    };
  } else {
    print(response.body);
    var errorMessage = json.decode(response.body);
    errorMessage = errorMessage["message"];

    Get.snackbar('Error', errorMessage, snackPosition: SnackPosition.BOTTOM);
    return {};
  }
}
