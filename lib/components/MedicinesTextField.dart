import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/utils/prescription/deleteMedicine.dart';
import 'package:mukh/utils/prescription/updateMedicine.dart';
import '../AppConstants/constant.dart';
import '../screen/patient/profile.dart';
import 'FormAddInput.dart';

class MedicineTextField extends StatefulWidget {
  const MedicineTextField(
      {Key? key,
      required this.medicinesId,
      required this.medicinesName,
      required this.medicinesDosage,
      required this.dosageStart,
      required this.dosageEnd,
      this.isRemove = true,
      required this.patientId,
      required this.instructions})
      : super(key: key);

  final String medicinesId,
      medicinesName,
      medicinesDosage,
      dosageStart,
      dosageEnd,
      instructions,
      patientId;

  final bool? isRemove;
  @override
  _MedicineTextFieldState createState() => _MedicineTextFieldState();
}

class _MedicineTextFieldState extends State<MedicineTextField> {
  late TextEditingController _nameController,
      _dosageController,
      _startController,
      _endController,
      _instructionsController;

  late bool isUpdateBtnDisabled;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _dosageController = TextEditingController();
    _startController = TextEditingController();
    _endController = TextEditingController();
    _instructionsController = TextEditingController();
    _nameController.text = widget.medicinesName;
    _dosageController.text = widget.medicinesDosage.split(' ')[0];
    _instructionsController.text = widget.instructions;
    _startController.text = widget.dosageStart;
    _endController.text = widget.dosageEnd;
    isUpdateBtnDisabled = true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dosageController.dispose();
    _startController.dispose();
    _endController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.off(() => PatientProfile(
              id: widget.patientId,
              index: 3,
            ));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.off(() => PatientProfile(
                    id: widget.patientId,
                    index: 3,
                  ));
            },
            icon: Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  await deleteMedicine(widget.medicinesId).then((value) {
                    if (value == 200) {
                      Get.off(() => PatientProfile(
                            id: widget.patientId,
                            index: 3,
                          ));
                    }
                  });
                },
                icon: Icon(Icons.delete)),
          ],
          title: Text('Edit Medicines'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FormAddInput(
                  'Medicine Name',
                  textEditingController: _nameController,
                  onChanged: (value) {
                    if (value != widget.medicinesName) {
                      setState(() {
                        isUpdateBtnDisabled = false;
                      });
                    } else {
                      setState(() {
                        isUpdateBtnDisabled = true;
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: FormAddInput(
                            'Dosage - Times/Day',
                            textEditingController: _dosageController,
                            textInputType: TextInputType.number,
                            onChanged: (value) {
                              if (value !=
                                  widget.medicinesDosage.split(' ')[0]) {
                                setState(() {
                                  isUpdateBtnDisabled = false;
                                });
                              } else {
                                setState(() {
                                  isUpdateBtnDisabled = true;
                                });
                              }
                            },
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          child: FormAddInput(
                            'From',
                            textEditingController: _startController,
                            readOnly: true,
                            textInputType: TextInputType.datetime,
                            onChanged: (value) {
                              if (value != widget.dosageStart) {
                                setState(() {
                                  isUpdateBtnDisabled = false;
                                });
                              } else {
                                setState(() {
                                  isUpdateBtnDisabled = true;
                                });
                              }
                            },
                            onTap: () async {
                              await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now())
                                  .then((value) {
                                if (value != null) {
                                  _startController.text =
                                      '${value.year}-${value.month}-${value.day}';
                                }
                              });
                            },
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          child: FormAddInput(
                            'To',
                            textEditingController: _endController,
                            readOnly: true,
                            textInputType: TextInputType.datetime,
                            onChanged: (value) {
                              if (value != widget.dosageEnd) {
                                setState(() {
                                  isUpdateBtnDisabled = false;
                                });
                              } else {
                                setState(() {
                                  isUpdateBtnDisabled = true;
                                });
                              }
                            },
                            onTap: () async {
                              await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2030))
                                  .then((value) {
                                if (value != null) {
                                  _endController.text =
                                      '${value.year}-${value.month}-${value.day}';
                                }
                              });
                            },
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: FormAddInput(
                  'Instructions',
                  textEditingController: _instructionsController,
                  textInputType: TextInputType.text,
                  onChanged: (value) {
                    if (value != widget.instructions) {
                      setState(() {
                        isUpdateBtnDisabled = false;
                      });
                    } else {
                      setState(() {
                        isUpdateBtnDisabled = true;
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: isUpdateBtnDisabled
                      ? null
                      : () async {
                          await updateMedicine(
                                  widget.medicinesId,
                                  _nameController.text,
                                  _dosageController.text,
                                  _startController.text,
                                  _endController.text,
                                  _instructionsController.text)
                              .then((value) {
                            if (value == 200) {
                              Get.off(() => PatientProfile(
                                    id: widget.patientId,
                                    index: 3,
                                  ));
                            }
                          });
                        },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: const Text('Update',
                        style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.center),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                      foregroundColor:
                          MaterialStateProperty.resolveWith(Constant.getColor),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 20.0))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
