import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/utils/token/getToken.dart';

Future<int> deleteMedicine(String id) async {
  String token = await getToken();
  final response = await http.delete(
    Uri.parse(Constant.baseUrl + 'api/medicines/' + id),
    headers: {"Authorization": "Bearer $token"},
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
