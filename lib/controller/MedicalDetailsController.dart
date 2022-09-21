import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:mukh/models/AcquiredDentalModel.dart';
import 'package:mukh/models/CongenitalDentalModel.dart';
import 'package:mukh/models/MedicalDetails.dart';

import '../AppConstants/constant.dart';
import 'package:http/http.dart' as http;

import '../utils/getMedicalDetailsPatient.dart';

class MedicalDetailsController extends GetxController{
  late MedicalDetails patientMedicalDetails;
  Future<bool> addUpdate(Map data, int patient_id) async{
    FlutterSecureStorage storage = new FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    if(token == null){
      Get.defaultDialog(title: "Error", content: Text("Unauthenticated"));
      return false;
    }
    Uri Url = Uri.parse(Constant.baseUrl + 'api/medicalHistories/${patient_id}');
    Map resBody;
    bool error = false;
    try{
      Get.defaultDialog(title: "Processing", content: CircularProgressIndicator());
      final http.Response response = await http.patch(Url,
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Bearer "+token,
            "Accepts" : "application/json"
          },
          body: data
      );
      resBody = jsonDecode(response.body);
      print(response.body);
      if(response.statusCode == 200){
        return true;
      }else{
        error = true;
      }
    }catch(e){
      print(e);
      error = true;
      resBody = {"message": "Server Error"};
      return false;
    }finally{
      Get.back();
    }

    if(error){
      Get.defaultDialog(title: "Error", content: Text(resBody["message"].toString()));
    }
    return false;
  }

  Future<MedicalDetails> getMedicalDetails(patient_id) async{
    MedicalDetails res = await getMedicalDetailsPatient(patient_id.toString());
    if(res != null){
      patientMedicalDetails = res;
    }
    return res;
  }
}