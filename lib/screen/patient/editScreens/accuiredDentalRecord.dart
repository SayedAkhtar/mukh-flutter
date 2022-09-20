import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/components/FormAddInput.dart';
import 'package:mukh/controller/AcquiredController.dart';
import 'package:mukh/models/AcquiredDentalModel.dart';
class AccuiredDentalRecords extends StatefulWidget {
  const AccuiredDentalRecords(String this.section, {Key? key}) : super(key: key);
  final String section;
  @override
  State<AccuiredDentalRecords> createState() => _AccuiredDentalRecordsState();
}

class _AccuiredDentalRecordsState extends State<AccuiredDentalRecords> {
  final ImagePicker _picker = ImagePicker();

  late XFile photo;

  // String dropdownValue = 'AB+';
  late final TextEditingController _mouthOpening,
      _condition,
      _tobacco,
      _trauma,
      _pain,
      _discharge,
      _burn,
      _surgery,
      _radiation,
      _swelling;


  @override
  void initState() {
    super.initState();
    _mouthOpening = TextEditingController();
    _condition = TextEditingController();
    _tobacco = TextEditingController();
    _trauma = TextEditingController();
    _pain = TextEditingController();
    _discharge = TextEditingController();
    _burn = TextEditingController();
    _surgery = TextEditingController();
    _radiation = TextEditingController();
    _swelling = TextEditingController();
    _condition.text = "Acquired";
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
        title: const Text('Upload Acquired Dental Records'),
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
                'Areca Nut/Tobacco',
                textEditingController: _tobacco,
                textInputType: TextInputType.number,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Areca Nut/Tobacco'),
              ),
              FormAddInput(
                'Trauma',
                textEditingController: _trauma,
                textInputType: TextInputType.number,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Trauma'),
              ),
              FormAddInput(
                'Pain',
                textEditingController: _pain,
                textInputType: TextInputType.number,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Pain'),
              ),
              FormAddInput(
                'Discharge',
                textEditingController: _discharge,
                textInputType: TextInputType.number,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Discharge'),
              ),
              FormAddInput(
                'Burn',
                textEditingController: _burn,
                textInputType: TextInputType.number,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Burn'),
              ),
              FormAddInput(
                'Surgery',
                textEditingController: _surgery,
                textInputType: TextInputType.number,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Surgery'),
              ),
              FormAddInput(
                'Radiation',
                textEditingController: _radiation,
                textInputType: TextInputType.number,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Radiation'),
              ),
              FormAddInput(
                'Swelling',
                textEditingController: _swelling,
                textInputType: TextInputType.number,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Swelling'),
              ),

              ElevatedButton(
                onPressed: () async {
                  AcquiredDentalModel ac = AcquiredDentalModel(
                      dentalRecordGroupId: null,
                      facePart: widget.section,
                      tobacco: _tobacco.text,
                    trauma: _trauma.text,
                    pain: _pain.text,
                    discharge: _discharge.text,
                    burn: _burn.text,
                    surgery: _surgery.text,
                    radiation: _radiation.text,
                    swelling: _swelling.text,
                  );
                  print(ac.toJson());
                  AcquiredController().addOne(ac);
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
