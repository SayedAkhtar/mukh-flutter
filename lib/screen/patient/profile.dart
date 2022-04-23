import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mukh/components/patientOptionsDialog.dart';
import 'package:mukh/screen/consultant/editDetailsTabs.dart';
import 'package:mukh/screen/patient/profile/personalInfo.dart';
import 'package:mukh/screen/patient/profile/dentalHistory.dart';
import 'package:mukh/screen/patient/profile/docReview.dart';
import 'package:mukh/screen/patient/profile/medHistory.dart';
import 'package:mukh/screen/patient/profile/medicines.dart';
import 'package:mukh/screen/patient/profile/others.dart';

import '../../AppConstants/constant.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({Key? key}) : super(key: key);

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30.0,
                        color: Constant.secondaryColor,
                      )),
                  IconButton(
                      onPressed: () {
                        // Get.to(EditPatientDetails());
                        getDialog();
                      },
                      icon: Icon(
                        Icons.list_rounded,
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
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                controller: _tabController,
                labelColor: Constant.mainColor,
                isScrollable: true,
                labelStyle: TextStyle(fontSize: 16.0),
                tabs: const <Widget>[
                  Tab(
                    text: "Personal information",
                  ),
                  Tab(
                    text: "Medical History",
                  ),
                  Tab(
                    text: "Dental History",
                  ),
                  Tab(
                    text: "Medicines",
                  ),
                  Tab(
                    text: "Others",
                  ),
                  Tab(
                    text: "Doctor\'s Review",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          PersonalInformation(),
          MedicalHistory(),
          DentalHistory(),
          Medicines(),
          Others(),
          DoctorReview(),
        ],
      ),
    );
  }
}
