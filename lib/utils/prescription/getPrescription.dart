import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/models/patient.dart';

import '../../models/prescription.dart';
import '../token/getToken.dart';

Future<List> getPrescription(String id) async {
  String token = await getToken();
  final response = await http.get(
    Uri.parse(Constant.baseUrl + 'api/patients/' + id + '/prescriptions'),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer $token"
    },
  );

  if (response.statusCode == 200) {
    var result = json.decode(response.body) as List;
    List<Prescription> prescriptions =
        result.map((i) => Prescription.fromJson(i)).toList();
    return prescriptions;
  } else {
    print(response.body);
    Get.snackbar('Error', 'Something went wrong.',
        snackPosition: SnackPosition.BOTTOM);
    return [];
  }
}
