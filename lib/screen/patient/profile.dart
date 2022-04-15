import 'package:flutter/material.dart';
import 'package:mukh/screen/patient/profile/personalInfo.dart';
import 'package:mukh/screen/patient/profile/dentalHistory.dart';
import 'package:mukh/screen/patient/profile/docReview.dart';
import 'package:mukh/screen/patient/profile/medHistory.dart';
import 'package:mukh/screen/patient/profile/medicines.dart';
import 'package:mukh/screen/patient/profile/others.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({Key? key}) : super(key: key);

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(225.0),
          child: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            flexibleSpace: SizedBox(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('asset/avatar-xl.png'),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Patient Name\n',
                              style: TextStyle(color: Colors.blue),
                            ),
                            Text(
                              'Patient ID: 123456789',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 14),
                            ),
                          ],
                        )
                      ]),
                ],
              ),
            ),
            leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.blue,
                )),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.blue,
                  ))
            ],
            backgroundColor: const Color(0xFFEFF5FF),
            bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.blue,
                isScrollable: true,
                tabs: [
                  Tab(text: 'Personal Information'),
                  Tab(text: 'Medical History'),
                  Tab(text: 'Dental History'),
                  Tab(text: 'Medicines'),
                  Tab(text: 'Others'),
                  Tab(text: 'Doctor\'s Review'),
                ]),
          ),
        ),
        body: TabBarView(children: [
          PersonalInformation(),
          MedicalHistory(),
          DentalHistory(),
          Medicines(),
          Others(),
          DoctorReview(),
        ]),
      ),
    );
  }
}
