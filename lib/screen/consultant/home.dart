import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/components/CardList.dart';
import 'package:mukh/components/CardWithDate.dart';
import 'package:mukh/components/SectionHeading.dart';
import 'package:mukh/models/doctor.dart';
import 'package:mukh/screen/consultant/allDoctors.dart';
import 'package:mukh/screen/consultant/allPatients.dart';

import '../../components/DoctorProfileAppBar.dart';
import '../../models/patient.dart';
import '../../utils/getAllDoctors.dart';
import '../../utils/getAllPatients.dart';

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
                  Get.to(() => AllPatients());
                }),
                Container(
                  height: 110,
                  child: FutureBuilder(
                    future: getAllPatients(1),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final patients =
                            (snapshot.data as Map)["patients_data"];
                        if (patients == null) return SizedBox.shrink();
                        var data = (patients as List<Patient>).toList();
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length > 3 ? 3 : data.length,
                          itemBuilder: (context, i) {
                            return CardList(
                                data[i].firstName + ' ' + data[i].lastName,
                                data[i].id);
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                SectionHeading("Recently Contacted Doctors", () {
                  Get.to(() => AllDoctors());
                }),
                Container(
                  height: 110,
                  child: FutureBuilder(
                    future: getAllDoctors(1),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final doctors = (snapshot.data as Map)["doctors_data"];
                        if (doctors == null) return SizedBox.shrink();
                        var data = (doctors as List<Doctor>).toList();

                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length > 3 ? 3 : data.length,
                          itemBuilder: (context, i) {
                            return CardList(
                                'Dr. ' +
                                    data[i].firstName +
                                    ' ' +
                                    data[i].lastName,
                                data[i].id);
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                )
              ],
            )),
      ),
    ));
  }
}
