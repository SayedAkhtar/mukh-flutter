import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/components/CardList.dart';
import 'package:mukh/components/CardWithDate.dart';
import 'package:mukh/components/SectionHeading.dart';
import 'package:mukh/models/doctor.dart';
import 'package:mukh/screen/LoginScreen.dart';
import 'package:mukh/screen/consultant/allDoctors.dart';
import 'package:mukh/screen/consultant/allPatients.dart';
import 'package:mukh/screen/patient/profile.dart';

import '../../components/DoctorProfileAppBar.dart';
import '../../models/patient.dart';
import '../../utils/get_doctor/getAllDoctors.dart';
import '../../utils/get_patient/getAllPatients.dart';
import '../../utils/storeAccountDetails.dart';
import 'profile.dart';

import 'package:mukh/utils/token/removeToken.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  final doctorName = "Atif Aslam";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: ElevatedButton(
    //     onPressed: () {
    //       removeToken().then((value) => Get.offAll(() => LoginScreen()));
    //     }, child: Text("Logout"),
    //   ),
    // );
    return SafeArea(
        child: FutureBuilder(
            future: Account.instance.getAccDetails(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Scaffold(
                  appBar: DoctorProfileAppBar(
                    doctorName: (snapshot.data as List<Map>)[0]['last_name'],
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
                                  CardWithDate("Sayed Akhtar", "1234567",
                                      "Wednesday, 07 September"),
                                  CardWithDate("Patient One", "1234567",
                                      "Wednesday, 07 September"),
                                  CardWithDate("Patient Two", "1234567",
                                      "Wednesday, 07 September"),
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
                                    if (patients == null)
                                      return SizedBox.shrink();
                                    var data =
                                        (patients as List<Patient>).toList();
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          data.length > 3 ? 3 : data.length,
                                      itemBuilder: (context, i) {
                                        return InkWell(
                                          onTap: () {
                                            Get.to(() =>
                                                PatientProfile(id: data[i].id));
                                          },
                                          child: CardList(
                                            data[i].firstName +
                                                ' ' +
                                                data[i].lastName,
                                            data[i].id,
                                            imagePath: data[i].image,
                                          ),
                                        );
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
                                    final doctors =
                                        (snapshot.data as Map)["doctors_data"];
                                    if (doctors == null)
                                      return SizedBox.shrink();
                                    var data =
                                        (doctors as List<Doctor>).toList();

                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          data.length > 3 ? 3 : data.length,
                                      itemBuilder: (context, i) {
                                        return InkWell(
                                          onTap: () {
                                            Get.to(() => DoctorProfile(
                                                isEditAllowed: false,
                                                id: data[i].id));
                                          },
                                          child: CardList(
                                              'Dr. ' +
                                                  data[i].firstName +
                                                  ' ' +
                                                  data[i].lastName,
                                              data[i].id),
                                        );
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
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
