import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/models/doctor.dart';
import 'package:mukh/screen/consultant/favDoctors.dart';
import 'package:mukh/utils/get_doctor/getAllDoctors.dart';

import '../../components/StyledInput.dart';
import '../../models/doctor.dart';
import 'profile.dart';

class AllDoctors extends StatefulWidget {
  const AllDoctors({Key? key}) : super(key: key);

  @override
  State<AllDoctors> createState() => _AllDoctorsState();
}

class _AllDoctorsState extends State<AllDoctors> {
  int _index = 1;
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(_width, 80),
            child: Container(
              width: _width,
              height: 80,
              decoration: BoxDecoration(
                color: Constant.mainColor,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(Icons.arrow_back, color: Colors.white)),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: StyledInput(
                        "Find a Doctor",
                        icon: Icons.search_rounded,
                        iconSize: 28.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: IconButton(
                        onPressed: () => Get.to(() => FavDoctors()),
                        icon: Icon(Icons.favorite, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: FutureBuilder(
              future: getAllDoctors(_index),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final doctors = (snapshot.data as Map)["doctors_data"];
                  int _count = (snapshot.data as Map)["total_pages"];

                  var data = (doctors as List<Doctor>).toList();

                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 15.0, 15.0, 0),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => DoctorProfile(
                                          isEditAllowed: false,
                                          id: data[index].id,
                                        ));
                                  },
                                  child: Row(children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 30.0),
                                      child: Image.asset('asset/avatar-1.png'),
                                    ),
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'Dr. ' +
                                                    data[index].firstName +
                                                    ' ' +
                                                    data[index].lastName,
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                'Doctor ID: ${data[index].id}'),
                                          ]),
                                    ),
                                  ]),
                                ),
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (_index > 1) _index--;
                                  });
                                },
                                child: Icon(Icons.arrow_back_ios)),
                            const SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  _index >= _count
                                      ? null
                                      : setState(() {
                                          _index++;
                                        });
                                },
                                child: Icon(Icons.arrow_forward_ios)),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )),
    );
  }
}
