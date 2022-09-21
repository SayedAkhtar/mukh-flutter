import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/controller/MedicalDetailsController.dart';
import 'package:mukh/controller/PatientController.dart';
import 'package:mukh/models/MedicalDetails.dart';

import '../../../AppConstants/constant.dart';

class UpdateMedicalDetails extends StatefulWidget {
  const UpdateMedicalDetails({Key? key}) : super(key: key);

  @override
  State<UpdateMedicalDetails> createState() => _UpdateMedicalDetailsState();
}

class _UpdateMedicalDetailsState extends State<UpdateMedicalDetails> {
  late bool _diabetes, _hypertension, _thyroid, _hyperthyroid, _hypothyroid, _other;
  late String _thyroidType = "";
  late TextEditingController _otherText;
  PatientController _patientController = Get.find();
  MedicalDetailsController _controller = Get.put(MedicalDetailsController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _diabetes = false;
    _hypertension = false;
    _thyroid = false;
    _hyperthyroid = false;
    _hypothyroid = false;
    _other = false;
    _otherText = TextEditingController();
    fetch();
  }

  fetch() async {
    MedicalDetails data = await _controller.getMedicalDetails(_patientController.currentPatient.value.id);
    setState(()=>{
      _diabetes = toBoolean(data.diabetes),
      _hypertension = toBoolean(data.hypertension),
      _thyroidType = data.thyroidType,
      _other = data.medicalConditions.length > 0
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            ),
            title: const Text('Upload Congenital Dental Records'),
            backgroundColor: Constant.mainColor,
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(16.0),
            child: Form(
              child: ListView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                shrinkWrap: true,
                children: [
                  CheckboxListTile(
                      title: Text("Diabetes"),
                      value: _diabetes,
                      onChanged: (bool) => {
                        setState(() => {
                          _diabetes = !_diabetes
                        })
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    title: Text("Hypertension"),
                    value: _hypertension,
                    onChanged: (bool) => {
                      setState(() => {
                        _hypertension = !_hypertension
                      })
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    title: Text("Thyroid"),
                    value: _thyroid,
                    onChanged: (bool) => {
                      // setState(() => {
                      //   _hypertension = !_hypertension
                      // })
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 40,),
                      Expanded(
                        child: CheckboxListTile(
                          title: Text("Hyperthyroidism"),
                          value: _hyperthyroid,
                          onChanged: (bool) => {
                            setState(() => {
                              _hypertension = !_hypertension,
                              _thyroidType = "hyperthyroidism"
                            })
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 40,),
                      Expanded(
                        child: CheckboxListTile(
                          title: Text("Hypothyroidism"),
                          value: _hypothyroid,
                          onChanged: (bool) => {
                            setState(() => {
                              _hypertension = !_hypertension,
                              _thyroidType = "hypothyroidism"
                            })
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                    ],
                  ),
                  CheckboxListTile(
                    title: Text("Any Other"),
                    value: _other,
                    onChanged: (bool) => {
                      setState(() => {
                        _other = !_other
                      })
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  SizedBox(
                    height: 300,
                    child: TextFormField(
                      controller: _otherText,
                      maxLines: 10,
                      minLines: 4,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(width: 1.0), borderRadius: BorderRadius.circular(15.0))
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      MedicalDetailsController().addUpdate({
                          "diabetes": _diabetes,
                          "hypertension": _hypertension,
                          "thyroid_type": _thyroidType,
                      }, int.parse(_patientController.currentPatient.value.id));
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text('Update',
                          style: TextStyle(fontSize: 20.0),
                          textAlign: TextAlign.center),
                    ),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(180.0),
                            )),
                        foregroundColor:
                        MaterialStateProperty.resolveWith(Constant.getColor),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 15.0))),
                  )
                ],
              ),
            ),
          ),
        ));
  }
  bool toBoolean(String d){
    return d == "1"?true:false;
  }
}
