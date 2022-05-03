import 'package:flutter/material.dart';
import 'package:mukh/components/medicineCardPatient.dart';
import 'package:mukh/models/prescription.dart';

import '../../../utils/prescription/getPrescription.dart';

class Medicines extends StatelessWidget {
  const Medicines({Key? key, required this.id}) : super(key: key);

  final String id;

  bool isBetween(String startDate, String endDate) {
    DateTime d = DateTime.now();
    DateTime s = DateTime.parse(startDate);
    DateTime e = DateTime.parse(endDate);
    return d.isAfter(s) && d.isBefore(e);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: FutureBuilder(
          future: getPrescription(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List prescriptions = snapshot.data as List<Prescription>;
              int _count = 0;
              List<String> names = [],
                  dosage = [],
                  instructions = [],
                  dosageStart = [],
                  dosageEnd = [];
              for (int i = 0; i < prescriptions.length; i++) {
                for (int j = 0;
                    j < (prescriptions[i].medicines.length as int);
                    j++) {
                  names.add(prescriptions[i].medicines[j].name as String);
                  dosage.add(prescriptions[i].medicines[j].dosage as String);
                  dosageStart
                      .add(prescriptions[i].medicines[j].dosageStart as String);
                  dosageEnd
                      .add(prescriptions[i].medicines[j].dosageEnd as String);
                  instructions.add(
                      prescriptions[i].medicines[j].instructions as String);
                }
                _count += prescriptions[i].medicines.length as int;
              }
              return ListView.builder(
                  itemCount: _count,
                  itemBuilder: (context, index) {
                    return MedicineCardPatient(
                        isActive: (isBetween(
                            dosageStart[index],
                            dosageEnd[index])),
                        name: names[index],
                        startDate: dosageStart[index],
                        endDate: dosageEnd[index],
                        dosage: dosage[index]);
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
