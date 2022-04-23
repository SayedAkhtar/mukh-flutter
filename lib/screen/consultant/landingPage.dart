import 'package:flutter/material.dart';
import 'package:mukh/screen/consultant/home.dart';

import '../notification.dart';
import 'addPatient.dart';

class DoctorLandingPage extends StatefulWidget {
  const DoctorLandingPage({Key? key, this.ifConsultant = true})
      : super(key: key);

  final bool ifConsultant;

  @override
  State<DoctorLandingPage> createState() => _DoctorLandingPageState();
}

class _DoctorLandingPageState extends State<DoctorLandingPage> {
  int _selectedTab = 1;

  List<Widget> _tabs = [
    Notifications(),
    Home(),
    AddPatient(),
  ];

  List<BottomNavigationBarItem> _bottomNavBarItemIfConsultant = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.add_alert,
          size: 28,
        ),
        label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.home, size: 28), label: ''),
    BottomNavigationBarItem(
        icon: Icon(Icons.person_add_alt_1, size: 28), label: '')
  ];

  List<BottomNavigationBarItem> _bottomNavBarItem = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.add_alert,
          size: 28,
        ),
        label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.home, size: 28), label: '')
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
          items: widget.ifConsultant
              ? _bottomNavBarItemIfConsultant
              : _bottomNavBarItem,
          onTap: (index) {
            setState(() {
              _selectedTab = index;
            });
          }),
    ));
  }
}
