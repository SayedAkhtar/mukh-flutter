import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/utils/token/getToken.dart';

Future<int> addMedicine(String patientId, String name, String dosage,
    String start, String end, String instructions) async {
  String token = await getToken();
  final response = await http.post(
    Uri.parse(
        Constant.baseUrl + 'api/patients/' + patientId + '/prescriptions'),
    headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/x-www-form-urlencoded",
    },
    encoding: Encoding.getByName('utf-8'),
    body: {
      "medicines[0][name]": name,
      "medicines[0][dosage]": dosage,
      "medicines[0][dosage_start]": start,
      "medicines[0][dosage_end]": end,
      "medicines[0][instructions]": instructions
    },
  );
  if (response.statusCode == 200) {
    return response.statusCode;
  } else {
    print(patientId);
    // print(response.body);
    var errorMessage = json.decode(response.body);
    errorMessage = errorMessage["message"];
    Get.snackbar('Error', errorMessage, snackPosition: SnackPosition.BOTTOM);
    return response.statusCode;
  }
}
