import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:mukh/models/AcquiredDentalModel.dart';
import 'package:mukh/models/CongenitalDentalModel.dart';

import '../AppConstants/constant.dart';
import 'package:http/http.dart' as http;

class DentalRecordGroupController extends GetxController{
  Future<int> addOne(String mouth_opening, String type,int patient_id) async{
    FlutterSecureStorage storage = new FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    if(token == null){
      Get.defaultDialog(title: "Error", content: Text("Unauthenticated"));
      return -1;
    }
    Uri Url = Uri.parse(Constant.baseUrl + 'api/patients/${patient_id}/dentalRecordGroups');
    Map resBody;
    bool error = false;
    try{
      Get.defaultDialog(title: "Processing", content: CircularProgressIndicator());
      final http.Response response = await http.post(Url,
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Bearer "+token,
          },
          body: {"mouth_opening": mouth_opening, "condition_type": type}
      );
      resBody = jsonDecode(response.body);
      print(response.body);
      if(response.statusCode == 200){
        return resBody["id"];
      }else{
        error = true;
      }
    }catch(e){
      print(e);
      return -1;
    }finally{
      Get.back();
    }

    if(error){
      Get.defaultDialog(title: "Error", content: Text(resBody["message"].toString()));
    }
    return -1;
  }
}