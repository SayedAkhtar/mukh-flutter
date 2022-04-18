import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mukh/components/patientDetailsEditTab.dart';

import '../../AppConstants/constant.dart';

class EditPatientDetails extends StatefulWidget {
  const EditPatientDetails({Key? key}) : super(key: key);

  @override
  State<EditPatientDetails> createState() => _EditPatientDetailsState();
}

class _EditPatientDetailsState extends State<EditPatientDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 220),
        child: Container(
          decoration: BoxDecoration(
              color: Constant.mainColor.withAlpha(60),
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0))),
          child: Column(
            children: [
              Row(
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
                    child: Image.asset('asset/avatar-xl.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Patient Name",
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      Text(
                        "Patient Id: 12343425",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Constant.mainColor,
                            fontWeight: FontWeight.w600,
                            height: 1.8),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 35.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Edit Details',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: PatientDetailsEditTab(
                      EditTabName: 'Personal Information',
                      icon: Icon(Icons.person, color: Colors.white)),
                ),
                InkWell(
                  onTap: () {},
                  child: PatientDetailsEditTab(
                      EditTabName: 'Upload Medical Details',
                      icon: Icon(Icons.medical_services, color: Colors.white)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: PatientDetailsEditTab(
                        EditTabName: 'Update New Medicines',
                        icon: Icon(Icons.medication, color: Colors.white)),
                  ),
                  InkWell(
                    onTap: () {},
                    child: PatientDetailsEditTab(
                        EditTabName: 'Upload Dental Records',
                        icon: Icon(Icons.face, color: Colors.white)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: PatientDetailsEditTab(
                        EditTabName: 'Others',
                        icon: Icon(Icons.window, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
