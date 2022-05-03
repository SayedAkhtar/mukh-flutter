import 'package:flutter/material.dart';
import 'package:mukh/AppConstants/constant.dart';

import '../../../models/MedicalDetails.dart';
import '../../../utils/getMedicalDetailsPatient.dart';

class MedicalHistory extends StatefulWidget {
  const MedicalHistory({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMedicalDetailsPatient(widget.id),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Scaffold(
            body: Center(),
          );
        }
        if (snapshot.hasData) {
          var data = snapshot.data as MedicalDetails;
          String otherMedConditions = '';
          for (int i = 0; i < data.medicalConditions.length; i++) {
            otherMedConditions += data.medicalConditions[i].desc + '\n';
          }
          if (otherMedConditions.length > 0 )
            otherMedConditions =
              otherMedConditions.substring(0, otherMedConditions.length - 1);
          return Column(
            children: [
              Row(
                children: [
                  Checkbox(
                      value: data.diabetes == 'null' || data.diabetes == '0'
                          ? false
                          : true,
                      onChanged: (changed) {}),
                  Text('Diabetes'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: data.hypertension == 'null' ||
                              data.hypertension == '0'
                          ? false
                          : true,
                      onChanged: (changed) {}),
                  Text('Hypertension'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: data.thyroidType == 'null' ? false : true,
                      onChanged: (changed) {}),
                  Text('Thyroid'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000.0)),
                        value: data.thyroidType == 'hyperthyroidism',
                        onChanged: (changed) {}),
                    Text('Hyperthyroidism'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000.0)),
                        value: data.thyroidType == 'hypothyroidism',
                        onChanged: (changed) {}),
                    Text('Hypothyroidism'),
                  ],
                ),
              ),
              Row(
                children: [
                  Checkbox(
                      value: data.medicalConditions.length == 0 ? false : true,
                      onChanged: (changed) {}),
                  Text('Any Other'),
                ],
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(left: 30, right: 30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(239, 245, 255, 1),
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(otherMedConditions)),
            ],
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
