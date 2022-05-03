import 'package:flutter/material.dart';

import '../../../components/MedicinesTextField.dart';

class EditMedicines extends StatefulWidget {
  const EditMedicines({ Key? key }) : super(key: key);

  static List<String> friendsList = [];

  @override
  State<EditMedicines> createState() => EditMedicinesState();
}

class EditMedicinesState extends State<EditMedicines> {
  static List<String> medicinesList = [];
  List<Widget> _getFriends(){
  List<Widget> friendsTextFieldsList = [];
  for(int i=0; i<medicinesList.length; i++){
    friendsTextFieldsList.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
             Expanded(child: MedicineTextField(i)),
             SizedBox(width: 16,),
             // we need add button at last friends row only
            //  _addRemoveButton(i == medicinesList.length-1, i),
          ],
        ),
      )
    );
  }
  return friendsTextFieldsList;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Medicines'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Edit Medicines'),
          ],
        ),
      ),);
  }
}
