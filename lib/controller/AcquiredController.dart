import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/models/AcquiredDentalModel.dart';

import '../AppConstants/constant.dart';
import 'package:http/http.dart' as http;

class AcquiredController extends GetxController{
  Future<bool> addOne(AcquiredDentalModel ac) async{
    print(ac.toJson());
    Uri Url = Uri.parse(Constant.baseUrl + 'api/dentalRecordGroups/1/acquiredRecords');
    Map resBody;
    bool error = false;
    try{
      Get.defaultDialog(title: "Processing", content: CircularProgressIndicator());
      final http.Response response = await http.post(Url,
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
          body: ac.toJson()
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
      return false;
    }finally{
      Get.back();
    }

    if(error){
      Get.defaultDialog(title: "Error", content: Text(resBody["message"].toString()));
    }
    return false;
  }
}