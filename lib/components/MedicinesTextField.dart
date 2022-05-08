import 'package:flutter/material.dart';
import 'package:mukh/utils/prescription/deleteMedicine.dart';
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
      required this.patientId})
      : super(key: key);

  final String medicinesId,
      medicinesName,
      medicinesDosage,
      dosageStart,
      dosageEnd,
      patientId;

  final bool? isRemove;
  @override
  _MedicineTextFieldState createState() => _MedicineTextFieldState();
}

class _MedicineTextFieldState extends State<MedicineTextField> {
  late TextEditingController _nameController,
      _dosageController,
      _startController,
      _endController;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _dosageController = TextEditingController();
    _startController = TextEditingController();
    _endController = TextEditingController();
    _nameController.text = widget.medicinesName;
    _dosageController.text = widget.medicinesDosage.split(' ')[0];
    _startController.text = widget.dosageStart;
    _endController.text = widget.dosageEnd;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dosageController.dispose();
    _startController.dispose();
    _endController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                  child: FormAddInput(
                    'Medicine Name',
                    textEditingController: _nameController,
                    onChanged: (value) {},
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    if (widget.isRemove!) {
                      await deleteMedicine(widget.medicinesId).then((value) {
                        if (value == 200) {
                          //TODO: get to update the list of current medicines after deletions

                          // PrescriptionController _prescriptionController =
                          //     PrescriptionController(widget.patientId);
                          // _prescriptionController.getPrescription(widget.patientId);
                        }
                      });
                    }
                  },
                  icon: Icon(widget.isRemove!
                      ? Icons.remove_circle_outline
                      : Icons.check_circle_outline_outlined),
                ),
              ],
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
                      width: MediaQuery.of(context).size.width / 4,
                      child: FormAddInput(
                        'Dosage',
                        textEditingController: _dosageController,
                        textInputType: TextInputType.number,
                      )),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: FormAddInput(
                        'From',
                        textEditingController: _startController,
                        readOnly: true,
                        textInputType: TextInputType.datetime,
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
                        onTap: () async {
                          await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now())
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
        ],
      ),
    );
  }
}
