import 'package:flutter/material.dart';
import 'package:mukh/screen/patient/profile.dart';

import '../../AppConstants/constant.dart';
import 'addPatient.dart';
import 'notification.dart';

class PatientHome extends StatefulWidget {
  const PatientHome({Key? key}) : super(key: key);

  @override
  State<PatientHome> createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
  int _selectedTab = 1;

  List<Widget> _tabs = [
    PatientNotifications(),
    PatientProfile(),
    AddPatient(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: _tabs.elementAt(_selectedTab),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_alert,
                  size: 28,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 28), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_add_alt_1, size: 28), label: ''),
          ],
          onTap: (index) {
            setState(() {
              _selectedTab = index;
            });
          }),
    ));
  }
}
