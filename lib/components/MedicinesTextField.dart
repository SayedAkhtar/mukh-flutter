import 'package:flutter/material.dart';
import '../screen/patient/editScreens/medicines.dart';

class MedicineTextField extends StatefulWidget {
  final int index;
  MedicineTextField(this.index);
  @override
  _MedicineTextFieldState createState() => _MedicineTextFieldState();
}
class _MedicineTextFieldState extends State<MedicineTextField> {
  late TextEditingController _nameController;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _nameController.text = EditMedicinesState.medicinesName[widget.index];
    });
    return TextFormField(
      controller: _nameController,
      // save text field data in friends list at index
      // whenever text field value changes
      onChanged: (v) => EditMedicinesState.medicinesName[widget.index] = v,
      decoration: InputDecoration(
        hintText: 'Enter your friend\'s name'
      ),
      validator: (v){
        if(v!.trim().isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}
