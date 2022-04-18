import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';

import '../../components/StyledInput.dart';

class AllDoctors extends StatefulWidget {
  const AllDoctors({Key? key}) : super(key: key);

  @override
  State<AllDoctors> createState() => _AllDoctorsState();
}

class _AllDoctorsState extends State<AllDoctors> {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(_width, 60),
            child: Container(
              width: _width,
              height: 60,
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
                    padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Image.asset('asset/avatar-1.png'),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Dr. John Doe',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                            Text('Doctor ID: 12345'),
                          ]),
                    ]),
                  );
                }),
          )),
    );
  }
}
