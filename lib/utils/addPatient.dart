import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<int> addPatient(
    BuildContext context,
    String firstName,
    String lastName,
    String email,
    String dob,
    String gender,
    String bg,
    String primaryPhone,
    String altPhone,
    String address,
    XFile image) async {
  final storage = new FlutterSecureStorage();
  String token = await storage.read(key: 'token') ?? '';
  print("token: $token");
  final response = await http.MultipartRequest(
      'POST', Uri.parse(Constant.baseUrl + 'api/patients'))
    ..headers.addAll({"Authorization": "Bearer $token"})
    ..fields.addAll({
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "date_of_birth": dob,
      "address": address,
      "gender": gender,
      "image": image.name,
      "blood_group": bg,
      "primary_phone": primaryPhone,
      "alt_phone": altPhone
    })
    ..files.add(await http.MultipartFile.fromPath(
      'image',
      image.path,
      filename: image.path.split('/').last,
    ));

  final result = await response.send();
  var responsed = await http.Response.fromStream(result);
  return responsed.statusCode;
}
