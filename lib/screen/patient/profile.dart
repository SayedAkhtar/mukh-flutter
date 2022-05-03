import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/components/patientOptionsDialog.dart';
import 'package:mukh/screen/patient/profile/personalInfo.dart';
import 'package:mukh/screen/patient/profile/dentalHistory.dart';
import 'package:mukh/screen/patient/profile/docReview.dart';
import 'package:mukh/screen/patient/profile/medHistory.dart';
import 'package:mukh/screen/patient/profile/medicines.dart';
import 'package:mukh/screen/patient/profile/others.dart';
import 'package:mukh/utils/get_patient/getOnePatient.dart';

import '../../AppConstants/constant.dart';
import '../../models/patient.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({Key? key, required this.id}) : super(key: key);

  final String id;

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
    return SafeArea(
      child: FutureBuilder(
          future: getOnePatient(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Patient patient = snapshot.data as Patient;
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
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  size: 30.0,
                                  color: Constant.secondaryColor,
                                )),
                            IconButton(
                                onPressed: () {
                                  getDialog();
                                },
                                icon: Icon(
                                  Icons.edit,
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
                                  Constant.baseUrl + 'storage/' +
                                      patient.image!,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    patient.firstName + '\n' + patient.lastName,
                                    style: TextStyle(
                                        fontSize: 24.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500)),
                                Text(
                                  "ID: ${patient.id}",
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
                            const Tab(
                              text: "Personal information",
                            ),
                            const Tab(
                              text: "Medical History",
                            ),
                            const Tab(
                              text: "Dental History",
                            ),
                            const Tab(
                              text: "Medicines",
                            ),
                            const Tab(
                              text: "Others",
                            ),
                            const Tab(
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
                  children: <Widget>[
                    PersonalInformation(patient: patient),
                    MedicalHistory(id: patient.id),
                    DentalHistory(),
                    Medicines(
                      id: patient.id,
                    ),
                    Others(),
                    DoctorReview(),
                  ],
                ),
              );
            } else {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }),
    );
  }
}
