import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mukh/AppConstants/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<dynamic> getPatientExtraDetails(String id) async {
  final storage = new FlutterSecureStorage();
  String token = await storage.read(key: 'token') ?? '';
  final response = await http.get(
    Uri.parse(Constant.baseUrl + 'api/patients/$id/patientExtraDetails'),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer $token"
    },
  );

  if (response.statusCode == 200) {
    var result = json.decode(response.body) as List;

    List<String> heading = [], description = [];

    for (int i = 0; i < result.length; i++) {
      heading.add(result[i]["heading"].toString());
      description.add(result[i]["description"].toString());
    }
    return {"heading": heading, "description": description};
  } else {
    var errorMessage = json.decode(response.body);
    errorMessage = errorMessage["message"];

    Get.snackbar('Error', errorMessage, snackPosition: SnackPosition.BOTTOM);
    return null;
  }
}
