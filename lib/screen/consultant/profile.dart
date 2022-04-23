import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/screen/consultant/profile/Availability.dart';
import 'package:mukh/screen/consultant/profile/PersonalInformation.dart';
import 'package:mukh/screen/consultant/profile/ProfessionalDetails.dart';
import 'package:mukh/screen/consultant/profile/ReferStatus.dart';

import '../../utils/getOneDoctor.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key? key, this.index = 0}) : super(key: key);

  final int? index;

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: widget.index!, length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: getOneDoctor(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null) return SizedBox.shrink();

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
                              onPressed: () {},
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
                              Text(
                                  (snapshot.data as Map)['doctors_data']
                                          .firstName +
                                      ' ' +
                                      (snapshot.data as Map)['doctors_data']
                                          .lastName,
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                              Text(
                                "Doctor Id: ${(snapshot.data as Map)['doctors_data'].id}",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Constant.mainColor,
                                    fontWeight: FontWeight.w600,
                                    height: 1.8),
                                textAlign: TextAlign.start,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                    color: Constant.mainColor,
                                    borderRadius: BorderRadius.circular(100)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: Text(
                                  "Verified",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      TabBar(
                        controller: _tabController,
                        labelColor: Constant.mainColor,
                        isScrollable: true,
                        labelStyle: TextStyle(fontSize: 16.0),
                        tabs: const <Widget>[
                          Tab(
                            text: "Personal information",
                          ),
                          Tab(
                            text: "Professional Details",
                          ),
                          Tab(
                            text: "Refer Status",
                          ),
                          Tab(
                            text: "Availability",
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
                  PersonalInformation(
                    doctor: (snapshot.data as Map)['doctors_data'],
                  ),
                  ProfessionalDetails(),
                  ReferStatus(),
                  Availability(),
                ],
              ),
              // bottomNavigationBar: BottomNavigationBar(
              //   currentIndex: 1,
              //   showSelectedLabels: false,
              //   showUnselectedLabels: false,
              //   items: const [
              //     BottomNavigationBarItem(
              //         icon: Icon(
              //           Icons.add_alert,
              //           size: 28,
              //         ),
              //         label: ''),
              //     BottomNavigationBarItem(
              //         icon: Icon(Icons.home, size: 28), label: ''),
              //     BottomNavigationBarItem(
              //         icon: Icon(Icons.person_add_alt_1, size: 28), label: ''),
              //   ],
              // ),
            );
          } else {
            return Scaffold(
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}

/*
* Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        Container(
                          width: _width * 0.4,
                          child: Text(
                            "First Name",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          child: Text("Sayed", softWrap: true,style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black38),),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        Container(
                          width: _width * 0.4,
                          child: Text(
                            "Last Name",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          child: Text("Sayed", softWrap: true,style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black38),),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        Container(
                          width: _width * 0.4,
                          child: Text(
                            "Last Name",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          child: Text("Sayed", softWrap: true,style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black38),),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        Container(
                          width: _width * 0.4,
                          child: Text(
                            "Last Name",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          child: Text("Sayed", softWrap: true,style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black38),),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        Container(
                          width: _width * 0.4,
                          child: Text(
                            "Last Name",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          child: Text("Sayed", softWrap: true,style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black38),),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        Container(
                          width: _width * 0.4,
                          child: Text(
                            "Last Name",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          child: Text("Sayed", softWrap: true,style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black38),),
                        ),
                      ],
                    ),
                  ),

                ],
              ),*/
