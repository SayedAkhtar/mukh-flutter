import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/models/patient.dart';
import 'package:mukh/screen/patient/editScreens/accuiredSectionSelection.dart';
import 'package:mukh/screen/patient/editScreens/congenitalDentalRecord.dart';
import 'package:mukh/screen/patient/editScreens/accuiredDentalRecord.dart';
import 'package:mukh/screen/patient/editScreens/selection.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PatientController extends GetxController{

  Rx<Patient> currentPatient =  Patient(id: "id", firstName: "firstName", lastName: "lastName", email: "email", dateOfBirth: "dateOfBirth", primaryPhone: "primaryPhone", address: "address", city: "city", type: "type", doctorId: "doctorId", createdAt: "createdAt", updatedAt: "updatedAt", deletedAt: "deletedAt", bloodGroup: "bloodGroup", gender: "gender").obs;

  Future<dynamic> getOnePatient(String id) async {
    final storage = new FlutterSecureStorage();
    String token = await storage.read(key: 'token') ?? '';
    final response = await http.get(
      Uri.parse(Constant.baseUrl + 'api/patients/$id'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      currentPatient.update((val) {
        val!.id = result["id"].toString();
        val.address = result["address"].toString();
        val.firstName = result["first_name"].toString();
        val.lastName = result["last_name"].toString();
        val.email = result["email"].toString();
        val.type = result["type"].toString();
        val.primaryPhone = result["primary_phone"].toString();
        val.alternatePhone = result["alt_phone"].toString();
        val.city = result["city"].toString();
        val.image = result["image"].toString();
        val.doctorId = result["doctor_id"].toString();
        val.createdAt = result["created_at"].toString();
        val.updatedAt = result["updated_at"].toString();
        val.deletedAt = result["deleted_at"].toString();
        val.bloodGroup = result["blood_group"].toString();
        val.dateOfBirth = result["date_of_birth"].toString();
        val.gender = result["gender"].toString();
      });
    } else {
      var errorMessage = json.decode(response.body);
      errorMessage = errorMessage["message"];

      Get.snackbar('Error', errorMessage, snackPosition: SnackPosition.BOTTOM);
      return null;
    }
  }

  void showEditDetailsSelection(){
    Get.to(() => SelectionScreen());
  }

  void showDentalRecords(type){
    if(type == "Acquired"){
      Get.to(() => AccuiredSectionSelection());

    }
    if(type == "Congenital"){
      Get.to(() => CongenitalDentalRecords(type: ""));
    }
    if(type == "Both"){
      Get.snackbar("Un Implemented", "This route has not yet been implemented");
    }
  }
}