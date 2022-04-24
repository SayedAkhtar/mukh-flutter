import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/screen/consultant/profile.dart';
import 'package:mukh/utils/updateDoctorPersonalInfo.dart';

import '../../../models/doctor.dart';

class EditPersonalInformation extends StatefulWidget {
  const EditPersonalInformation({Key? key, required this.doctor})
      : super(key: key);

  final Doctor doctor;

  @override
  State<EditPersonalInformation> createState() =>
      _EditPersonalInformationState();
}

class _EditPersonalInformationState extends State<EditPersonalInformation> {
  late TextEditingController _contactNo,
      _registrationId,
      _alternateContactNo,
      _gender,
      _city,
      _firstName,
      _lastName;

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Constant.mainColor),
      fillColor: Constant.secondaryColor.withOpacity(0.15),
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(color: Colors.transparent)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(color: Colors.transparent)),
    );
  }

  @override
  void initState() {
    _contactNo = TextEditingController();
    _alternateContactNo = TextEditingController();
    _registrationId = TextEditingController();
    _gender = TextEditingController();
    _city = TextEditingController();
    _lastName = TextEditingController();
    _firstName = TextEditingController();
    _registrationId.text =
        widget.doctor.regId == 'null' ? '' : widget.doctor.regId;
    _firstName.text =
        widget.doctor.firstName == 'null' ? '' : widget.doctor.firstName;
    _lastName.text =
        widget.doctor.lastName == 'null' ? '' : widget.doctor.lastName;
    _contactNo.text =
        widget.doctor.primaryPhone == 'null' ? '' : widget.doctor.primaryPhone;
    _alternateContactNo.text = ((widget.doctor.alternatePhone ?? '') == 'null'
        ? ''
        : widget.doctor.alternatePhone)!;
    _gender.text =
        widget.doctor.gender == 'null' ? 'Unspecified' : widget.doctor.gender;
    _city.text = widget.doctor.city == 'null' ? '' : widget.doctor.city;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double _padding = 20.0;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            )),
        title: Text('Personal Information', style: TextStyle(fontSize: 20)),
      ),
      body: Padding(
        padding: EdgeInsets.all(_padding),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            TextFormField(
              controller: _firstName,
              keyboardType: TextInputType.name,
              decoration: _inputDecoration('First Name'),
            ),
            Padding(
              padding: EdgeInsets.only(top: _padding),
              child: TextFormField(
                controller: _lastName,
                keyboardType: TextInputType.name,
                decoration: _inputDecoration('Last Name'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _padding),
              child: TextFormField(
                controller: _contactNo,
                keyboardType: TextInputType.phone,
                decoration: _inputDecoration('Contact Number'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _padding),
              child: TextFormField(
                controller: _alternateContactNo,
                keyboardType: TextInputType.phone,
                decoration: _inputDecoration('Alternate Contact Number'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: _padding),
              child: TextFormField(
                controller: _registrationId,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration('Registration ID'),
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                decoration: _inputDecoration(_gender.text),
                isExpanded: true,
                // borderRadius: BorderRadius.all(Radius.circular(10)),
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
            Padding(
              padding: EdgeInsets.only(top: _padding),
              child: TextFormField(
                keyboardType: TextInputType.streetAddress,
                controller: _city,
                decoration: _inputDecoration('City'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _padding),
              child: ElevatedButton(
                onPressed: () async {
                  int responseCode = await updateDoctorPersonalInfo(
                      context,
                      _firstName.text,
                      _lastName.text,
                      widget.doctor.type,
                      widget.doctor.email,
                      _registrationId.text,
                      widget.doctor.id,
                      _contactNo.text,
                      _alternateContactNo.text,
                      _gender.text,
                      _city.text);

                  if (responseCode == 200) {
                    Get.off(() => DoctorProfile());
                  } else {
                    Get.snackbar('Error', 'Try again',
                        snackPosition: SnackPosition.BOTTOM);
                  }
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
                        const EdgeInsets.symmetric(vertical: 20.0))),
              ),
            )
          ]),
        ),
      ),
    ));
  }
}
