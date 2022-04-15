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
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'First Name',
                style: _titles(),
              ),
              Text(
                'Last Name',
                style: _titles(),
              ),
              Text(
                'Contact Number',
                style: _titles(),
              ),
              Text(
                'Alt. Contact Number',
                style: _titles(),
              ),
              Text(
                'Email',
                style: _titles(),
              ),
              Text(
                'D. O. B.',
                style: _titles(),
              ),
              Text(
                'Age',
                style: _titles(),
              ),
              Text(
                'Gender',
                style: _titles(),
              ),
              Text(
                'B. G.',
                style: _titles(),
              ),
              Text(
                'Address',
                style: _titles(),
              ),
            ],
          ),
          const SizedBox(
            width: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Shourya',
                style: _details(),
              ),
              Text(
                'Shikhar',
                style: _details(),
              ),
              Text(
                '1234567890',
                style: _details(),
              ),
              Text(
                '0987654321',
                style: _details(),
              ),
              Text(
                'test@xyz.com',
                style: _details(),
              ),
              Text(
                '29-02-1947',
                style: _details(),
              ),
              Text(
                '87',
                style: _details(),
              ),
              Text(
                'Male',
                style: _details(),
              ),
              Text(
                'B +ve',
                style: _details(),
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
