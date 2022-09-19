import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/screen/consultant/editDetailsTabs.dart';
import 'package:mukh/screen/consultant/editScreens/editPersonalInformation.dart';
import 'package:mukh/screen/consultant/editScreens/editProfessionalDetails.dart';
import 'package:mukh/screen/consultant/profile/Availability.dart';
import 'package:mukh/screen/consultant/profile/PersonalInformation.dart';
import 'package:mukh/screen/consultant/profile/ProfessionalDetails.dart';
import 'package:mukh/screen/consultant/profile/ReferStatus.dart';
import 'package:mukh/utils/fav_doctor/isFavDoc.dart';

import '../../utils/fav_doctor/addFavDoc.dart';
import '../../utils/fav_doctor/removeFavDoc.dart';
import '../../utils/get_doctor/getOneDoctor.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile(
      {Key? key, this.index = 0, this.isEditAllowed = true, this.id})
      : super(key: key);

  final int? index;
  final String? id;
  final bool? isEditAllowed;

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
        future: getOneDoctor(widget.id ?? ''),
        builder: (context, AsyncSnapshot<Map> snapshot) {
          Map? data = snapshot.data;
          // print(snapshot.data);
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
                                widget.isEditAllowed!
                                    ? Get.off(() => EditDetailsTabs())
                                    : Get.back();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 30.0,
                                color: Constant.secondaryColor,
                              )),
                          widget.isEditAllowed!
                              ? IconButton(
                                  onPressed: () {
                                    if (_tabController!.index == 0) {
                                      Get.off(() => EditPersonalInformation(
                                          doctor: (snapshot.data
                                              as Map)['doctors_data']));
                                    } else if (_tabController!.index == 1) {
                                      String id =
                                          (snapshot.data as Map)['doctors_data']
                                              .id;
                                      Map profDetails = (snapshot.data
                                          as Map)['professional_details'];
                                      profDetails['id'] = id;
                                      Get.off(() => EditProfessionalDetails(
                                          profDetails: profDetails));
                                    }
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    size: 30.0,
                                    color: Constant.secondaryColor,
                                  ))
                              : FutureBuilder(
                                  future: isFavDoc(widget.id ?? ''),
                                  builder: ((context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data == null)
                                        return SizedBox.shrink();
                                      var data = snapshot.data as bool;
                                      return IconButton(
                                          onPressed: () async {
                                            if (data) {
                                              await removeFavDoc(
                                                      widget.id ?? '')
                                                  .then((value) =>
                                                      setState(() {}));
                                            } else {
                                              await addFavDoc(widget.id ?? '')
                                                  .then((value) =>
                                                      setState(() {}));
                                            }
                                          },
                                          icon: Icon(
                                            data
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            size: 30.0,
                                            color: Constant.secondaryColor,
                                          ));
                                    } else {
                                      return SizedBox.shrink();
                                    }
                                  })),
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
                                      '\n' +
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
                  ProfessionalDetails(
                      profDetails:
                      data!['professional_details']),
                  ReferStatus(),
                  Availability(
                      profDetails:
                          (snapshot.data as Map)['professional_details']),
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
