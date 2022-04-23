import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/components/StyledInput.dart';

import '../../AppConstants/constant.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({Key? key}) : super(key: key);

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  String dropdownValue = 'AB+';
  late final TextEditingController _firstName,
      _lastName,
      _age,
      _phone,
      _address,
      _email,
      _altPhone,
      _image,
      _dob,
      _gender,
      _bg;

  @override
  void initState() {
    super.initState();
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _age = TextEditingController();
    _phone = TextEditingController();
    _address = TextEditingController();
    _email = TextEditingController();
    _altPhone = TextEditingController();
    _image = TextEditingController();
    _dob = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.arrow_back),
        // ),
        title: const Text('Add new patient'),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height - 200,
          padding: EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                FormAddInput(
                  'First Name *',
                  textEditingController: _firstName,
                  margin: EdgeInsets.only(bottom: 10),
                ),
                FormAddInput(
                  'Last Name *',
                  textEditingController: _lastName,
                  margin: EdgeInsets.only(bottom: 10),
                ),
                FormAddInput(
                  'Contact Number *',
                  textEditingController: _phone,
                  textInputType: TextInputType.phone,
                  margin: EdgeInsets.only(bottom: 10),
                ),
                FormAddInput(
                  'Alternate Number',
                  textEditingController: _altPhone,
                  textInputType: TextInputType.phone,
                  margin: EdgeInsets.only(bottom: 10),
                ),
                FormAddInput(
                  'Email Id *',
                  textEditingController: _email,
                  textInputType: TextInputType.emailAddress,
                  margin: EdgeInsets.only(bottom: 10),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: (MediaQuery.of(context).size.width / 2) - 30.0,
                          child: FormAddInput(
                            'DOB *',
                            textInputType: TextInputType.datetime,
                            margin: EdgeInsets.only(
                              bottom: 10,
                            ),
                          )),
                      Container(
                        width: (MediaQuery.of(context).size.width / 2) - 30.0,
                        child: FormAddInput('Age *',
                            textEditingController: _age,
                            margin: EdgeInsets.only(
                              bottom: 10,
                            )),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: (MediaQuery.of(context).size.width / 2) - 30.0,
                          child: FormAddInput(
                            'Gender *',
                            margin: EdgeInsets.only(
                              bottom: 10,
                            ),
                          )),
                      Container(
                          width: (MediaQuery.of(context).size.width / 2) - 30.0,
                          child: FormAddDropdown('', dropdownValue, (True) {
                            print("Down");
                          })),
                    ],
                  ),
                ),
                FormAddInput(
                  'Address *',
                  textEditingController: _address,
                  textInputType: TextInputType.emailAddress,
                  margin: EdgeInsets.only(bottom: 10),
                ),
                FormAddInput(
                  'Image *',
                  textEditingController: _image,
                  margin: EdgeInsets.only(bottom: 10),
                ),
                ElevatedButton(
                  onPressed: () async {},
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text('Add Patient',
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
      ),
    ));
  }
}

class FormAddInput extends StatelessWidget {
  const FormAddInput(this.textLabel,
      {Key? key,
      this.icon,
      this.iconSize = 20,
      this.margin = EdgeInsets.zero,
      this.textEditingController,
      this.textInputType})
      : super(key: key);
  final String textLabel;
  final IconData? icon;
  final double iconSize;
  final EdgeInsets margin;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextField(
        keyboardType: textInputType ?? TextInputType.text,
        controller: textEditingController,
        decoration: InputDecoration(
          fillColor: Color.fromRGBO(239, 245, 255, 1),
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          labelText: textLabel,
        ),
      ),
    );
  }
}

class FormAddDropdown extends StatelessWidget {
  const FormAddDropdown(this.textLabel, this.dropdown, this.onChanged,
      {Key? key, this.icon, this.iconSize = 20, this.margin = EdgeInsets.zero})
      : super(key: key);
  final String textLabel;
  final IconData? icon;
  final double iconSize;
  final EdgeInsets margin;
  final ValueChanged onChanged;
  final dropdown;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: DropdownButtonFormField<String>(
        value: dropdown,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        decoration: InputDecoration(
          fillColor: Color.fromRGBO(239, 245, 255, 1),
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          labelText: textLabel,
        ),
        onChanged: (String) => onChanged,
        items: <String>[
          'AB+',
          'AB-',
          'A+',
          'A-',
          'B+',
          'B-',
          'O+',
          'O-',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
