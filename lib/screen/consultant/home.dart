import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/components/CardList.dart';
import 'package:mukh/components/CardWithDate.dart';
import 'package:mukh/components/SectionHeading.dart';
import 'package:mukh/screen/consultant/allDoctors.dart';
import 'package:mukh/screen/patient/allPatients.dart';

import '../../components/DoctorProfileAppBar.dart';
import '../notification.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  final doctorName = "Atif Aslam";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: DoctorProfileAppBar(
        doctorName: "Sayed",
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                SectionHeading("Pending Cases", () {
                  print("Object");
                }),
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CardWithDate(
                          "Sayed Akhtar", "1234567", "Wednesday, 07 September"),
                      CardWithDate(
                          "Patient One", "1234567", "Wednesday, 07 September"),
                      CardWithDate(
                          "Patient Two", "1234567", "Wednesday, 07 September"),
                    ],
                  ),
                ),
                SectionHeading("Recent Patient", () {
                  Get.to(AllPatients());
                }),
                Container(
                  height: 110,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CardList("Fauzia Akhtar", "123457567"),
                      CardList("Fauzia Akhtar", "123457567"),
                      CardList("Fauzia Akhtar", "123457567")
                    ],
                  ),
                ),
                SectionHeading("Recently Contacted Doctors", () {
                  Get.to(AllDoctors());
                }),
                Container(
                  height: 110,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [CardList("Fauzia Akhtar", "123457567")],
                  ),
                )
              ],
            )),
      ),
    ));
  }
}
