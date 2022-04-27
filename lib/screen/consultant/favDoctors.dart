import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/models/doctor.dart';

import '../../models/doctor.dart';
import '../../utils/fav_doctor/getAllFavDocs.dart';
import 'profile.dart';

class FavDoctors extends StatefulWidget {
  const FavDoctors({Key? key}) : super(key: key);

  @override
  State<FavDoctors> createState() => _FavDoctorsState();
}

class _FavDoctorsState extends State<FavDoctors> {
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
                  Text('Favourite Doctors',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: FutureBuilder(
              future: getAllFavDocs(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = (snapshot.data as List<Doctor>);
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
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
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            ]),
                          ),
                        );
                      });
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
