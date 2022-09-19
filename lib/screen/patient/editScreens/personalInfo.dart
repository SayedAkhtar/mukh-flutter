import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/components/FormAddInput.dart';

class EditPersonalInformation extends StatefulWidget {
  const EditPersonalInformation({Key? key}) : super(key: key);

  @override
  State<EditPersonalInformation> createState() => _EditPersonalInformationState();
}

class _EditPersonalInformationState extends State<EditPersonalInformation> {
  late final TextEditingController _contactNumber,
      _alternateNumber,
      _email,
      _address,
      _bg;

  @override
  void initState() {
    super.initState();
    _contactNumber = TextEditingController();
    _alternateNumber = TextEditingController();
    _email = TextEditingController();
    _address = TextEditingController();
    _bg = TextEditingController();
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
        title: const Text('Personal Information'),
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
                'Contact Number *',
                textEditingController: _contactNumber,
                textInputType: TextInputType.phone,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Contact Number *'),
              ),
              FormAddInput('Alternate Number *',
                  textEditingController: _alternateNumber,
                  textInputType: TextInputType.phone,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: _inputDecoration('Alternate Number *')),
              FormAddInput(
                'Email Id',
                textEditingController: _email,
                textInputType: TextInputType.emailAddress,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Email Id'),
              ),
              DropdownButtonHideUnderline(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: DropdownButtonFormField<String>(
                    decoration: _inputDecoration('Blood Group'),
                    isExpanded: true,
                    items: <String>[
                      'AB+',
                      'AB-',
                      'A+',
                      'A-',
                      'B+',
                      'B-',
                      'O+',
                      'O-',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      _bg.text = value!;
                    },
                  ),
                ),
              ),
              FormAddInput(
                'Address',
                textEditingController: _address,
                textInputType: TextInputType.streetAddress,
                margin: EdgeInsets.only(bottom: 10),
                decoration: _inputDecoration('Address'),
              ),
              ElevatedButton(
                onPressed: () async {},
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
