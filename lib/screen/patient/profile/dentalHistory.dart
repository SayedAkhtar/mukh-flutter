import 'package:flutter/material.dart';

import '../../../components/dentalRecordsCardPatient.dart';

class DentalHistory extends StatelessWidget {
  const DentalHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return DentalRecordsCardPatient(
              isActive: index == 4
                  ? false
                  : index == 2
                      ? false
                      : true,
              refDocName: 'Dr. A. Agarwala',
              diagDocName: 'Dr. S. Agarwala',
              date: 'Wednesday, 7 September',
            );
          }),
    );
  }
}
