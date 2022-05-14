import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mukh/AppConstants/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mukh/models/patient.dart';

import '../../models/doctor.dart';

Future<dynamic> searchDoctor(String name) async {
  final storage = new FlutterSecureStorage();
  String token = await storage.read(key: 'token') ?? '';
  final response = await http.get(
    Uri.parse(Constant.baseUrl + 'api/doctors/?search=' + name),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer $token"
    },
  );

  if (response.statusCode == 200) {
    var result = json.decode(response.body);
    var doctorsData = result['data'] as List;

    List<Doctor> doctors = [];

    for (int i = 0; i < doctorsData.length; i++) {
      Doctor _doctor = Doctor(
          id: doctorsData[i]["id"].toString(),
          firstName: doctorsData[i]["first_name"].toString(),
          lastName: doctorsData[i]["last_name"].toString(),
          email: doctorsData[i]["email"].toString(),
          type: doctorsData[i]["type"].toString(),
          primaryPhone: doctorsData[i]["primary_phone"].toString(),
          alternatePhone: doctorsData[i]["alt_phone"].toString(),
          city: doctorsData[i]["city"].toString(),
          image: doctorsData[i]["image"].toString(),
          regId: doctorsData[i]["registration_id"].toString(),
          createdAt: doctorsData[i]["created_at"].toString(),
          updatedAt: doctorsData[i]["updated_at"].toString(),
          deletedAt: doctorsData[i]["deleted_at"].toString(),
          accountVerifiedAt: doctorsData[i]["account_verified_at"].toString(),
          emailVerifiedAt: doctorsData[i]["email_verified_at"].toString(),
          gender: doctorsData[i]["gender"].toString());
      doctors.add(_doctor);
    }

    return {"total_pages": result['last_page'], "doctors_data": doctors};
  } else {
    var errorMessage = json.decode(response.body);
    errorMessage = errorMessage["message"];

    Get.snackbar('Error', errorMessage, snackPosition: SnackPosition.BOTTOM);
    return null;
  }
}
