import 'package:flutter/material.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  TextStyle _titles() {
    return TextStyle(
      color: Colors.black,
    );
  }

  TextStyle _details() {
    return TextStyle(
      color: Colors.blueGrey,
      overflow: TextOverflow.ellipsis,
    );
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'First Name',
                style: _titles(),
              ),
              Text(
                'Shourya',
                style: _details(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Last Name',
                style: _titles(),
              ),
              Text(
                'Shikhar',
                style: _details(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Contact Number',
                style: _titles(),
              ),
              Text(
                '1234567890',
                style: _details(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Alt. Contact Number',
                style: _titles(),
              ),
              Text(
                '0987654321',
                style: _details(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Email',
                style: _titles(),
              ),
              Text(
                'test@xyz.com',
                style: _details(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'D. O. B.',
                style: _titles(),
              ),
              Text(
                '29-02-1947',
                style: _details(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Age',
                style: _titles(),
              ),
              Text(
                '87',
                style: _details(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Gender',
                style: _titles(),
              ),
              Text(
                'Male',
                style: _details(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'B. G.',
                style: _titles(),
              ),
              Text(
                'B +ve',
                style: _details(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Address',
                style: _titles(),
              ),
              Text(
                '221B Baker Street',
                style: _details(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
