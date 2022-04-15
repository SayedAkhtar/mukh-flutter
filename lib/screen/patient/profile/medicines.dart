import 'package:flutter/material.dart';
import 'package:mukh/components/medicineCardPatient.dart';

class Medicines extends StatelessWidget {
  const Medicines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return MedicineCardPatient(
                isActive: index == 4
                    ? false
                    : index == 2
                        ? false
                        : true,
                name: 'Paracetamol',
                startDate: 'Jan 06, 2022',
                endDate: 'Feb 06. 2022',
                dosage: 4);
          }),
    );
  }
}
