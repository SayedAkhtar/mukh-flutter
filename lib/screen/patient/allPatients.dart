import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';

import '../../components/StyledInput.dart';

class AllPatients extends StatefulWidget {
  const AllPatients({Key? key}) : super(key: key);

  @override
  State<AllPatients> createState() => _AllPatientsState();
}

class _AllPatientsState extends State<AllPatients> {
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
            padding: const EdgeInsets.only(bottom: 15.0),
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15.0, 0, 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 25.0),
                                child: Image.asset('asset/avatar-1.png'),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Patient Name',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold)),
                                    Text('Patient ID: 12345'),
                                  ]),
                              Padding(
                                padding: EdgeInsets.only(left: _width * 0.3),
                                child: InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(1000.0),
                                      border:
                                          Border.all(color: Constant.mainColor),
                                    ),
                                    child: Text(
                                      'Refer',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Constant.mainColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                  );
                }),
          )),
    );
  }
}
