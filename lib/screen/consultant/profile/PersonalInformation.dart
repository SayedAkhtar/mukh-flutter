import 'package:flutter/material.dart';

import '../../../models/doctor.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({
    Key? key,
    required this.doctor,
  }) : super(key: key);

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Row(
                children: [
                  Container(
                    width: _width * 0.4,
                    child: const Text(
                      "First Name",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      doctor.firstName,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black38),
                    ),
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
                    child: const Text(
                      "Last Name",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      doctor.lastName,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black38),
                    ),
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
                    child: const Text(
                      "Reg. ID",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      doctor.regId,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black38),
                    ),
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
                    child: const Text(
                      "Contact",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      doctor.primaryPhone,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black38),
                    ),
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
                    child: const Text(
                      "Alternate Contact",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      doctor.alternatePhone!,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black38),
                    ),
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
                    child: const Text(
                      "Email",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      doctor.email,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black38),
                    ),
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
                    child: const Text(
                      "Gender",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      doctor.gender,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black38),
                    ),
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
                    child: const Text(
                      "City",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      doctor.city,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black38),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
