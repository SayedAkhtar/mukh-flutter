import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/components/FormAddInput.dart';
import 'package:mukh/controller/CongenitalController.dart';
import 'package:mukh/controller/DentalRecordGroupController.dart';
import 'package:mukh/models/CongenitalDentalModel.dart';

import '../../../controller/PatientController.dart';

class CongenitalDentalRecords extends StatefulWidget {
  const CongenitalDentalRecords({Key? key, @required this.type}) : super(key: key);
  final String? type;

  @override
  State<CongenitalDentalRecords> createState() => _CongenitalDentalRecordsState();
}

class _CongenitalDentalRecordsState extends State<CongenitalDentalRecords> {
  final ImagePicker _picker = ImagePicker();
  PatientController inst = Get.find();

  late XFile photo;

  late final TextEditingController _mouthOpening,
      _condition,
      _earDeformity,
      _eyeDeformity,
      _noseDeformity,
      _micrognathia,
      _forehead,
      _teeth,
      _cleft,
      _hair,
      _skin,
      _digits,
      _image;

  @override
  void initState() {
    super.initState();
    _mouthOpening = TextEditingController();
    _condition = TextEditingController();
    _earDeformity = TextEditingController();
    _eyeDeformity = TextEditingController();
    _noseDeformity = TextEditingController();
    _micrognathia = TextEditingController();
    _forehead = TextEditingController();
    _teeth = TextEditingController();
    _cleft = TextEditingController();
    _hair = TextEditingController();
    _skin = TextEditingController();
    _digits = TextEditingController();
    _image = TextEditingController();
    _condition.text = "Congenital";
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey),
      floatingLabelStyle: TextStyle(color: Constant.mainColor),
      fillColor: Colors.transparent,
      filled: false,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey)),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: Colors.grey),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey)),
    );
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
            children: [
              FormAddInput(
                'Mouth Opening In (mm) *',
                textEditingController: _mouthOpening,
                textInputType: TextInputType.number,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Mouth Opening In (mm) *'),
              ),
              FormAddInput(
                  'Condition *',
                  textEditingController: _condition,
                  textInputType: TextInputType.text,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: _inputDecoration('Condition *'),
                  readOnly:true
              ),
              FormAddInput(
                'Ear Deformity',
                textEditingController: _earDeformity,
                textInputType: TextInputType.number,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Ear Deformity'),
              ),
              FormAddInput(
                'Nose Deformity',
                textEditingController: _noseDeformity,
                textInputType: TextInputType.number,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Nose Deformity'),
              ),
              FormAddInput(
                'Micrognathia',
                textEditingController: _micrognathia,
                textInputType: TextInputType.number,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Micrognathia'),
              ),
              FormAddInput(
                'Forehead',
                textEditingController: _forehead,
                textInputType: TextInputType.number,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Forehead'),
              ),
              FormAddInput(
                'Teeth',
                textEditingController: _teeth,
                textInputType: TextInputType.number,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Teeth'),
              ),
              FormAddInput(
                'Cleft',
                textEditingController: _cleft,
                textInputType: TextInputType.number,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Cleft'),
              ),
              FormAddInput(
                'Hair',
                textEditingController: _hair,
                textInputType: TextInputType.number,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Hair'),
              ),
              FormAddInput(
                'Skin',
                textEditingController: _skin,
                textInputType: TextInputType.number,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Skin'),
              ),
              FormAddInput(
                'Digits',
                textEditingController: _digits,
                textInputType: TextInputType.number,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Digits'),
              ),
              ElevatedButton(
                onPressed: () async {
                  CongenitalDentalModel cdm = CongenitalDentalModel(
                    earDeformity: _earDeformity.text,
                    eyeDeformity: _eyeDeformity.text,
                    noseDeformity: _noseDeformity.text,
                    micrognathia: _micrognathia.text,
                    forehead: _forehead.text,
                    teeth: _teeth.text,
                    cleft: _cleft.text,
                    hair: _cleft.text,
                    skin: _skin.text,
                    digits: _digits.text,
                  );
                  DentalRecordGroupController().addOne(_mouthOpening.text, _condition.text.toLowerCase(), int.parse(inst.currentPatient.value.id))
                  .then((value){
                    if(value > 0){
                      CongenitalController().addOne(cdm, value)
                          .then((value) => {
                        if(value){
                          Get.defaultDialog(title: "Success", content: Text("Data updated successfully."))
                        }
                      });
                    }
                  });


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
}
