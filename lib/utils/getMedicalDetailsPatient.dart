import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/models/MedicalDetails.dart';

import 'token/getToken.dart';

Future<dynamic> getMedicalDetailsPatient(String id) async {
  String token = await getToken();

  final response = await http.get(
    Uri.parse(
        Constant.baseUrl + 'api/patients/${id.toString()}/medicalHistory'),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer $token"
    },
  );

  if (response.statusCode == 200) {
    var result = json.decode(response.body);

    List<MedicalCondition> _medCondList = [];
    var _medicalConditions = result['medical_conditions'];

    for (int i = 0; i < _medicalConditions.length; i++) {
      MedicalCondition _medicalCondition = MedicalCondition(
        id: _medicalConditions[i]['id'].toString(),
        medHistId: _medicalConditions[i]['medical_history_id'].toString(),
        desc: _medicalConditions[i]['description'].toString(),
        createdAt: _medicalConditions[i]['created_at'].toString(),
        updatedAt: _medicalConditions[i]['updated_at'].toString(),
      );
      _medCondList.add(_medicalCondition);
    }

    MedicalDetails _medicalDetails = MedicalDetails(
      id: result["id"].toString(),
      patientId: result["patient_id"].toString(),
      diabetes: result["diabetes"].toString(),
      hypertension: result["hypertension"].toString(),
      thyroidType: result["thyroid_type"].toString(),
      createdAt: result["created_at"].toString(),
      updatedAt: result["updated_at"].toString(),
      deletedAt: result["deleted_at"].toString(),
      medicalDocs: result["medical_documents"],
      medicalConditions: _medCondList,
    );
    return _medicalDetails;
  } else {
    var errorMessage = json.decode(response.body);
    errorMessage = errorMessage["message"];

    Get.snackbar('Error', errorMessage, snackPosition: SnackPosition.BOTTOM);
    return null;
  }
}
