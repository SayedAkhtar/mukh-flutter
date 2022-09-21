import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mukh/controller/PatientController.dart';
import 'package:mukh/screen/consultant/profile/PersonalInformation.dart';
import 'package:mukh/screen/editPersonalInformation.dart';
import 'package:mukh/screen/patient/editScreens/others.dart';
import 'package:mukh/screen/patient/editScreens/personalInfo.dart';
import 'package:mukh/screen/patient/editScreens/updateMedicalDetails.dart';
import 'package:mukh/screen/patient/editScreens/updateNewMedicine.dart';

import '../../../AppConstants/constant.dart';
import '../../../utils/prescription/getPrescription.dart';
import 'medicines.dart';

class SelectionScreen extends StatelessWidget {
  SelectionScreen({Key? key}) : super(key: key);
  final _patientController = Get.put(PatientController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 180),
          child: Container(
            decoration: BoxDecoration(
                color: Constant.mainColor.withAlpha(60),
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30.0,
                          color: Constant.secondaryColor,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.0, right: 35.0),
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: Colors.white,
                      ),
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage: NetworkImage(
                          Constant.baseUrl + 'storage/avatars/' + 'default.png',
                        ),
                      ),
                    ),
                    Obx(() =>
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                            Text(
                                _patientController.currentPatient.value.firstName + '\n' + _patientController.currentPatient.value.lastName,
                                style: TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),


                        Text(
                          "ID: ${_patientController.currentPatient.value.id}",
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Constant.mainColor,
                              fontWeight: FontWeight.w600,
                              height: 1.8),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),)
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15.0),
              child: Text(
                'Edit Details',
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w300),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30.0,
                  mainAxisSpacing: 30.0,
                  children: [
                    SelectionCard(() => Get.to(() => EditPersonalInformation()), 'person.png',
                        'Personal\nInformation'),
                    SelectionCard(() => Get.to(() => UpdateMedicalDetails()), 'medical.png',
                        'Upload\nMedical Details'),
                    SelectionCard(() => Get.to(() => UpdateNewMedicine()), 'medicine.png',
                        'Update New\nMedicine'),
                    SelectionCard(() {
                      Get.defaultDialog(
                        title: "",
                        content: Dropdown(),
                      );
                    }, 'dental.png', 'Upload Dental\nRecords'),
                    SelectionCard(() => Get.to(() => EditExtraDetails()), 'other.png', 'Other'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectionCard extends StatelessWidget {
  const SelectionCard(
      Function this.onPressed, String this.imageName, String this.title,
      {Key? key})
      : super(key: key);
  final Function onPressed;
  final String imageName;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        decoration: BoxDecoration(
            color: Constant.secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('asset/' + imageName),
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

class Dropdown extends StatefulWidget {
  const Dropdown({Key? key}) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  late String dropdownValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownValue = "Acquired";
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Constant.mainColor),
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Constant.mainColor)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Constant.mainColor)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Upload Dental Records",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800)),
        SizedBox(height: 30,),
        Container(
          padding: EdgeInsets.all(18.0),
          width: double.infinity,
          color: Colors.white,
          child: DropdownButtonFormField<String>(
            decoration: _inputDecoration("Condition"),
            isExpanded: true,
            value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['Acquired', 'Congenital', 'Both']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),),
              );
            }).toList(),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              print(dropdownValue);
              PatientController inst = Get.find();
              Get.back();
              inst.showDentalRecords(dropdownValue);
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 26.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(105.0)))),
            child: Text(
              "Next",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700),
            ))
      ],
    );
  }
}
