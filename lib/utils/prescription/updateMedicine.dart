import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/utils/token/getToken.dart';

Future<int> updateMedicine(String id, String name, String dosage, String start,
    String end, String instructions) async {
  String token = await getToken();
  final response = await http.patch(
    Uri.parse(Constant.baseUrl + 'api/medicines/' + id),
    headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/x-www-form-urlencoded",
    },
    encoding: Encoding.getByName('utf-8'),
    body: {
      "name": name,
      "dosage": dosage,
      "dosage_start": start,
      "dosage_end": end,
      "instructions": instructions
    },
  );
  if (response.statusCode == 200) {
    return response.statusCode;
  } else {
    var errorMessage = json.decode(response.body);
    errorMessage = errorMessage["message"];
    Get.snackbar('Error', errorMessage, snackPosition: SnackPosition.BOTTOM);
    return response.statusCode;
  }
}
