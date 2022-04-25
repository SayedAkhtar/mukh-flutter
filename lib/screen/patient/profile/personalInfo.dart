import 'package:flutter/material.dart';

import '../../../models/patient.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({Key? key, required this.patient})
      : super(key: key);

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: Flexible(
                      child: Text(
                        patient.firstName,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black38),
                      ),
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
                    child: Flexible(
                      child: Text(
                        patient.lastName,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black38),
                      ),
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
                    child: Flexible(
                      child: Text(
                        patient.primaryPhone,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black38),
                      ),
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
                      "Alternate contact",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Flexible(
                      child: Text(
                        patient.alternatePhone ?? '',
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black38),
                      ),
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
                    child: Flexible(
                      child: Text(
                        patient.email,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black38),
                      ),
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
                      "D. O. B.",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Flexible(
                      child: Text(
                        patient.dateOfBirth,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black38),
                      ),
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
                    child: Flexible(
                      child: Text(
                        patient.gender.toString(),
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black38),
                      ),
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
                      "Blood Group",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Flexible(
                      child: Text(
                        patient.bloodGroup.toString(),
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black38),
                      ),
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
                      "Address",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Flexible(
                      child: Text(
                        patient.address,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black38),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
