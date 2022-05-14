import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mukh/AppConstants/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mukh/models/patient.dart';

Future<dynamic> searchPatient(String name) async {
  final storage = new FlutterSecureStorage();
  String token = await storage.read(key: 'token') ?? '';
  final response = await http.get(
    Uri.parse(Constant.baseUrl + 'api/patients/?search=' + name),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer $token"
    },
  );

  if (response.statusCode == 200) {
    var result = json.decode(response.body);
    var patientsData = result['data'] as List;

    List<Patient> patients = [];

    for (int i = 0; i < patientsData.length; i++) {
      Patient _patient = Patient(
          address: patientsData[i]["address"].toString(),
          id: patientsData[i]["id"].toString(),
          firstName: patientsData[i]["first_name"].toString(),
          lastName: patientsData[i]["last_name"].toString(),
          email: patientsData[i]["email"].toString(),
          type: patientsData[i]["type"].toString(),
          primaryPhone: patientsData[i]["primary_phone"].toString(),
          alternatePhone: patientsData[i]["alt_phone"].toString(),
          city: patientsData[i]["city"].toString(),
          image: patientsData[i]["image"].toString(),
          doctorId: patientsData[i]["doctor_id"].toString(),
          createdAt: patientsData[i]["created_at"].toString(),
          updatedAt: patientsData[i]["updated_at"].toString(),
          deletedAt: patientsData[i]["deleted_at"].toString(),
          bloodGroup: patientsData[i]["blood_group"].toString(),
          dateOfBirth: patientsData[i]["date_of_birth"].toString(),
          gender: patientsData[i]["gender"].toString());
      patients.add(_patient);
    }

    print(patientsData);

    return {"total_pages": result['last_page'], "patients_data": patients};
  } else {
    var errorMessage = json.decode(response.body);
    errorMessage = errorMessage["message"];

    Get.snackbar('Error', errorMessage, snackPosition: SnackPosition.BOTTOM);
    return null;
  }
}
