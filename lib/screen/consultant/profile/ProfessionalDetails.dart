import 'package:flutter/material.dart';

class ProfessionalDetails extends StatelessWidget {
  const ProfessionalDetails({Key? key, required this.profDetails})
      : super(key: key);

  final Map profDetails;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    String _qualifications = '', _languages = '';

    for (int i = 0; i < profDetails['qualifications'].length; i++) {
      _qualifications += '; ' + profDetails['qualifications'][i];
    }

    for (int i = 0; i < profDetails['languages'].length; i++) {
      _languages += '; ' + profDetails['languages'][i];
    }

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
                      "Qualifications",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      _qualifications,
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
                      "Hospital",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      profDetails['hospital'] ?? '',
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
                      "Department",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      profDetails['department'] ?? '',
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
                      "Designation",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      profDetails['designation'] ?? '',
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
                      "Specialization",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      profDetails['specialization'] ?? '',
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
                      "Years of Experience",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      profDetails['years_of_experience'].toString(),
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
                      "Achievements",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      profDetails['achievements'] ?? '',
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
                      "Fellowship Membership",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      profDetails['fellowship_membership'] ?? '',
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
                      "Languages Known",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      _languages,
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
