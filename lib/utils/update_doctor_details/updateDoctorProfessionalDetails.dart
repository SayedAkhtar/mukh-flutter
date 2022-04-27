import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mukh/AppConstants/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<int> updateDoctorProfessionalDetails(
    BuildContext context,
    String id,
    String hospital,
    String department,
    String specialization,
    String designation,
    String achievements,
    String fellowshipMembership,
    String yearsOfExperience) async {
  final storage = new FlutterSecureStorage();
  String token = await storage.read(key: 'token') ?? '';
  final response = await http.post(
    Uri.parse(Constant.baseUrl + 'api/doctors/$id/professionalDetails'),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer $token"
    },
    encoding: Encoding.getByName('utf-8'),
    body: {
      "_method": "PATCH",
      "hospital": hospital,
      "department": department,
      "designation": designation,
      "specialization": specialization,
      "years_of_experience": yearsOfExperience,
      "fellowship_membership": fellowshipMembership,
      "achievements": achievements,
    },
  );

  if (response.statusCode == 200) {
    return response.statusCode;
  } else {
    return response.statusCode;
  }
}
