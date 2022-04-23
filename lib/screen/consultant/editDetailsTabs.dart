import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mukh/components/detailsEditTab.dart';
import 'package:mukh/screen/consultant/profile.dart';

import '../../AppConstants/constant.dart';
import '../../utils/storeAccountDetails.dart';

class EditDetailsTabs extends StatefulWidget {
  const EditDetailsTabs({Key? key}) : super(key: key);

  @override
  State<EditDetailsTabs> createState() => _EditPatientDetailsState();
}

class _EditPatientDetailsState extends State<EditDetailsTabs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder(
      future: Account.instance.getAccDetails(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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
                            Text(
                                (snapshot.data as List<Map>)[0]['first_name'] +
                                    ' ' +
                                    (snapshot.data as List<Map>)[0]
                                        ['last_name'],
                                style: TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                            Text(
                              "ID: ${(snapshot.data as List<Map>)[0]['_id']}",
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 35.0),
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
                        onTap: () {
                          Get.to(() => DoctorProfile(
                                index: 0,
                              ));
                        },
                        child: DetailsEditTab(
                            EditTabName: 'Personal Information',
                            icon: Icon(Icons.person, color: Colors.white)),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => DoctorProfile(
                                index: 1,
                              ));
                        },
                        child: DetailsEditTab(
                            EditTabName: 'Professional Details',
                            icon: Icon(Icons.medical_services,
                                color: Colors.white)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => DoctorProfile(
                                  index: 2,
                                ));
                          },
                          child: DetailsEditTab(
                              EditTabName: 'My referred Patients',
                              icon:
                                  Icon(Icons.medication, color: Colors.white)),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => DoctorProfile(
                                  index: 3,
                                ));
                          },
                          child: DetailsEditTab(
                              EditTabName: 'Check Availability',
                              icon: Icon(Icons.face, color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 20.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       InkWell(
                  //         onTap: () {},
                  //         child: DetailsEditTab(
                  //             EditTabName: 'Others',
                  //             icon: Icon(Icons.window, color: Colors.white)),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    ));
  }
}
