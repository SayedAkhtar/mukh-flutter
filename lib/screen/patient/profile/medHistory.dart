import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';

class MedicalHistory extends StatefulWidget {
  const MedicalHistory({Key? key}) : super(key: key);

  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  @override
  Widget build(BuildContext context) {
    bool anyOther = true;
    return Column(
      children: [
        Row(
          children: [
            Checkbox(value: true, onChanged: (changed) {}),
            Text('Diabetes'),
          ],
        ),
        Row(
          children: [
            Checkbox(value: true, onChanged: (changed) {}),
            Text('Hypertension'),
          ],
        ),
        Row(
          children: [
            Checkbox(value: true, onChanged: (changed) {}),
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
                  value: false,
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
                  value: true,
                  onChanged: (changed) {}),
              Text('Hypothyroidism'),
            ],
          ),
        ),
        Row(
          children: [
            Checkbox(value: anyOther, onChanged: (changed) {}),
            Text('Any Other'),
          ],
        ),
        anyOther
            ? Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(left: 30, right: 30),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Constant.secondaryColor),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text('bdcjevjerjvberjbvjervbebrviervbre'))
            : Center(),
      ],
    );
  }
}
