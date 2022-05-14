import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/utils/get_patient/search_patient.dart';

import '../models/doctor.dart';
import '../models/patient.dart';
import '../utils/get_doctor/search_doctor.dart';
import 'consultant/profile.dart';
import 'patient/profile.dart';

class Search extends StatefulWidget {
  const Search({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 120),
          child: Container(
            decoration: BoxDecoration(
              color: Constant.mainColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      Text(
                        'Search results',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                TabBar(
                    controller: _tabController,
                    labelColor: Colors.white,
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(text: 'Patients'),
                      Tab(text: 'Doctors'),
                    ]),
              ],
            ),
          ),
        ),
        body: TabBarView(controller: _tabController, children: <Widget>[
          FutureBuilder(
              future: searchPatient(widget.name),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var result = snapshot.data as Map;
                  return ListView.builder(
                      itemCount: result['patients_data'].length,
                      itemBuilder: (context, index) {
                        List<Patient> data = result['patients_data'];
                        return Padding(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
                          child: InkWell(
                            onTap: () async {
                              Get.to(() => PatientProfile(
                                    id: data[index].id,
                                  ));
                            },
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: NetworkImage(
                                    Constant.baseUrl +
                                        'storage/' +
                                        data[index].image!,
                                  ),
                                ),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          FutureBuilder(
              future: searchDoctor(widget.name),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var result = snapshot.data as Map;
                  return ListView.builder(
                      itemCount: result['doctors_data'].length,
                      itemBuilder: (context, index) {
                        List<Doctor> data = result['doctors_data'];
                        return Padding(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => DoctorProfile(
                                    isEditAllowed: false,
                                    id: data[index].id,
                                  ));
                            },
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 30.0),
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
                                              fontWeight: FontWeight.bold)),
                                      Text('Doctor ID: ${data[index].id}'),
                                    ]),
                              ),
                            ]),
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ]),
      ),
    );
  }
}
