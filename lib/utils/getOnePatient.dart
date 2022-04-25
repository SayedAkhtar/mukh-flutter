import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mukh/AppConstants/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mukh/models/patient.dart';

Future<dynamic> getOnePatient(String id) async {
  final storage = new FlutterSecureStorage();
  String token = await storage.read(key: 'token') ?? '';
  final response = await http.get(
    Uri.parse(Constant.baseUrl + 'api/patients/$id'),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer $token"
    },
  );

  if (response.statusCode == 200) {
    var result = json.decode(response.body);

    Patient _patient = Patient(
        id: result["id"].toString(),
        address: result["address"].toString(),
        firstName: result["first_name"].toString(),
        lastName: result["last_name"].toString(),
        email: result["email"].toString(),
        type: result["type"].toString(),
        primaryPhone: result["primary_phone"].toString(),
        alternatePhone: result["alt_phone"].toString(),
        city: result["city"].toString(),
        image: result["image"].toString(),
        doctorId: result["doctor_id"].toString(),
        createdAt: result["created_at"].toString(),
        updatedAt: result["updated_at"].toString(),
        deletedAt: result["deleted_at"].toString(),
        bloodGroup: result["blood_group"].toString(),
        dateOfBirth: result["date_of_birth"].toString(),
        gender: result["gender"].toString());
    return _patient;
  } else {
    var errorMessage = json.decode(response.body);
    errorMessage = errorMessage["message"];

    Get.snackbar('Error', errorMessage, snackPosition: SnackPosition.BOTTOM);
    return null;
  }
}
