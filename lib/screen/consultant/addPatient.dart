import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mukh/utils/addPatient.dart';

import '../../AppConstants/constant.dart';
import '../../components/FormAddInput.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({Key? key}) : super(key: key);

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  final ImagePicker _picker = ImagePicker();
  late XFile photo;
  // String dropdownValue = 'AB+';
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
    _bg = TextEditingController();
    _email = TextEditingController();
    _altPhone = TextEditingController();
    _image = TextEditingController();
    _dob = TextEditingController();
    _gender = TextEditingController();
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Constant.mainColor),
      fillColor: const Color.fromRGBO(239, 245, 255, 1),
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.transparent)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.transparent)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add new patient'),
        backgroundColor: Constant.mainColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                FormAddInput(
                  'First Name *',
                  textEditingController: _firstName,
                  textInputType: TextInputType.name,
                  margin: EdgeInsets.only(bottom: 10),
                ),
                FormAddInput(
                  'Last Name *',
                  textEditingController: _lastName,
                  textInputType: TextInputType.name,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: (MediaQuery.of(context).size.width / 2) - 30.0,
                        child: FormAddInput(
                          'DOB *',
                          textEditingController: _dob,
                          readOnly: true,
                          onTap: () async {
                            await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now())
                                .then((value) {
                              if (value != null) {
                                _dob.text =
                                    '${value.year}-${value.month}-${value.day}';
                                _age.text =
                                    '${DateTime.now().difference(value).inDays ~/ 365}';
                              }
                            });
                          },
                          textInputType: TextInputType.datetime,
                          margin: EdgeInsets.only(
                            bottom: 10,
                          ),
                        )),
                    Container(
                      width: (MediaQuery.of(context).size.width / 2) - 30.0,
                      child: FormAddInput('Age *',
                          readOnly: true,
                          textEditingController: _age,
                          textInputType: TextInputType.number,
                          margin: EdgeInsets.only(
                            bottom: 10,
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 2) - 30.0,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<String>(
                          decoration: _inputDecoration('Gender'),
                          isExpanded: true,
                          items: <String>['Male', 'Female', 'Unspecified']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            _gender.text = value!.toLowerCase();
                          },
                        ),
                      ),
                    ),
                    Container(
                        width: (MediaQuery.of(context).size.width / 2) - 30.0,
                        child: DropdownButtonHideUnderline(
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
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: FormAddInput(
                    'Address *',
                    textEditingController: _address,
                    textInputType: TextInputType.streetAddress,
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                ),
                FormAddInput(
                  'Image *',
                  readOnly: true,
                  isImage: true,
                  onTap: () async {
                    showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height / 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10.0, 20.0, 10.0, 0.0),
                                  child: Text(
                                    'Capture or pick image',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                            onPressed: () async {
                                              Navigator.pop(context);
                                              await _picker
                                                  .pickImage(
                                                source: ImageSource.camera,
                                                maxHeight: 480,
                                                maxWidth: 480,
                                                imageQuality: 50,
                                              )
                                                  .then((value) {
                                                if (value != null) {
                                                  _image.text = value.path;
                                                  photo = value;
                                                }
                                              });
                                            },
                                            icon: Icon(
                                              Icons.camera,
                                              size: 56.0,
                                              color: Constant.mainColor,
                                            )),
                                        IconButton(
                                            onPressed: () async {
                                              Navigator.pop(context);
                                              await _picker
                                                  .pickImage(
                                                      source:
                                                          ImageSource.gallery,
                                                      maxHeight: 480,
                                                      maxWidth: 480,
                                                      imageQuality: 50)
                                                  .then((value) {
                                                if (value != null) {
                                                  _image.text = value.path;
                                                  photo = value;
                                                }
                                                return null;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.photo_library,
                                              size: 56.0,
                                              color: Constant.mainColor,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  textEditingController: _image,
                  margin: EdgeInsets.only(bottom: 10),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_firstName.text.isEmpty ||
                        _lastName.text.isEmpty ||
                        _dob.text.isEmpty ||
                        _phone.text.isEmpty ||
                        _address.text.isEmpty ||
                        _gender.text.isEmpty ||
                        _bg.text.isEmpty ||
                        !_email.text.contains('@') ||
                        _image.text.isEmpty) {
                      Get.snackbar('Error', 'Fill all details correctly',
                          snackPosition: SnackPosition.BOTTOM);
                    } else {
                      int response = await addPatient(
                          context,
                          _firstName.text,
                          _lastName.text,
                          _email.text,
                          _dob.text,
                          _gender.text,
                          _bg.text,
                          _phone.text,
                          _altPhone.text,
                          _address.text,
                          photo);

                      if (response == 200) {
                        Get.snackbar('SUCCESS', 'Patient added successfully.',
                            snackPosition: SnackPosition.BOTTOM);
                      } else {
                        Get.snackbar('Error', 'Something went wrong',
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    }
                  },
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
