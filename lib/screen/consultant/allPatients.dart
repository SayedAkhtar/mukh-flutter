import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/models/patient.dart';
import 'package:mukh/screen/patient/profile.dart';

import '../../components/StyledInput.dart';
import '../../utils/get_patient/getAllPatients.dart';

class AllPatients extends StatefulWidget {
  const AllPatients({Key? key}) : super(key: key);

  @override
  State<AllPatients> createState() => _AllPatientsState();
}

class _AllPatientsState extends State<AllPatients> {
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
                        "Find a Patient",
                        icon: Icons.search_rounded,
                        iconSize: 28.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: FutureBuilder(
              future: getAllPatients(_index),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final patients = (snapshot.data as Map)["patients_data"];
                  int _count = (snapshot.data as Map)["total_pages"];

                  var data = (patients as List<Patient>).toList();

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
                                  onTap: () async {
                                    Get.to(() => PatientProfile(
                                          id: data[index].id,
                                        ));
                                  },
                                  child: Row(children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 30.0),
                                      child: Image.asset('asset/avatar-1.png'),
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              data[index].firstName +
                                                  ' ' +
                                                  data[index].lastName,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold)),
                                          Text('Patient ID: ${data[index].id}'),
                                        ]),
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
