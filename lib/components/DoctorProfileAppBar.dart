import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/screen/consultant/editDetailsTabs.dart';

import '../AppConstants/constant.dart';
import 'ProfilepicWidget.dart';
import 'StyledInput.dart';

class DoctorProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  DoctorProfileAppBar({Key? key, this.doctorName = "Your Name"})
      : super(key: key);
  final doctorName;

  @override
  // TODO: implement preferredSize
  final Size preferredSize = Size(double.infinity, 220.0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 220,
          width: Size.infinite.width,
          color: Constant.mainColor,
          padding: const EdgeInsets.only(
              left: 18.0, top: 18.0, bottom: 5.0, right: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'asset/logo-negetive.png',
                height: 40,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                "Hello, Dr. ${doctorName}",
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                "What do you need ?",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const StyledInput(
                "Find a doctor or patient",
                icon: Icons.search_rounded,
                iconSize: 32.0,
              )
            ],
          ),
        ),
        Positioned(
            top: -130,
            right: -130,
            child: GestureDetector(
                onTap: () {
                  Get.to(() => EditDetailsTabs());
                },
                child: ProfilepicWidget())),
      ],
    );
  }
}
