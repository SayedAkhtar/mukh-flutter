import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mukh/screen/patient/profile.dart';
import 'package:mukh/utils/prescription/getPrescription.dart';

import '../../../components/MedicinesTextField.dart';

class EditMedicines extends StatefulWidget {
  const EditMedicines({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<EditMedicines> createState() => EditMedicinesState();
}

class EditMedicinesState extends State<EditMedicines> {
  List<String> medicineId = [];
  static List<String> medicinesName = [];
  List<String> medicinesDosage = [];
  List<String> dosageStart = [];
  List<String> dosageEnd = [];

  @override
  void initState() {
    super.initState();
  }

  List<Widget> _displayMedicines() {
    List<Widget> medicines = [];
    for (int i = 0; i < medicineId.length; i++) {
      medicines.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Row(
          children: [
            Expanded(child: MedicineTextField(i)),
            SizedBox(
              width: 16,
            ),
            // we need add button at last friends row only
            // _addRemoveButton(i == medicinesList.length - 1, i),
          ],
        ),
      ));
    }
    return medicines;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Medicines'),
        leading: GetBuilder<PrescriptionController>(builder: (value) {
          List prescriptions = value.prescriptions;
          return IconButton(
            onPressed: () {
              Get.off(() => PatientProfile(
                    id: widget.id,
                    index: 3,
                  ));
            },
            icon: Icon(Icons.arrow_back),
          );
        }),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<PrescriptionController>(builder: (value) {
          List prescriptions = value.prescriptions;
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
              dosageEnd.add(prescriptions[i].medicines[j].dosageEnd as String);
              instructions
                  .add(prescriptions[i].medicines[j].instructions as String);
            }
            _count += prescriptions[i].medicines.length as int;
          }
          print(names);
          return Column(
            children: [
              ..._displayMedicines(),
            ],
          );
        }),
      ),
    );
  }
}
