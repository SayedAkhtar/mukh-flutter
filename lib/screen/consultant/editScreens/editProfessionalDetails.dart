import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/screen/consultant/profile.dart';

import '../../../utils/updateDoctorProfessionalDetails.dart';

class EditProfessionalDetails extends StatefulWidget {
  const EditProfessionalDetails({Key? key, required this.profDetails})
      : super(key: key);

  final Map profDetails;

  @override
  State<EditProfessionalDetails> createState() =>
      _EditPersonalInformationState();
}

class _EditPersonalInformationState extends State<EditProfessionalDetails> {
  late TextEditingController _hospital,
      _specialization,
      _department,
      _designation,
      _yearsOfExperience,
      _fellowshipMembership,
      _achievements;

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
    _hospital = TextEditingController();
    _specialization = TextEditingController();
    _department = TextEditingController();
    _designation = TextEditingController();
    _yearsOfExperience = TextEditingController();
    _fellowshipMembership = TextEditingController();
    _achievements = TextEditingController();
    _hospital.text = widget.profDetails['hospital'] ?? '';
    _specialization.text = widget.profDetails['specialization'] ?? '';
    _department.text = widget.profDetails['department'] ?? '';
    _designation.text = widget.profDetails['designation'] ?? '';
    _yearsOfExperience.text =
        widget.profDetails['years_of_experience'].toString() == 'null'
            ? ''
            : widget.profDetails['years_of_experience'].toString();
    _fellowshipMembership.text =
        widget.profDetails['fellowship_membership'] ?? '';
    _achievements.text = widget.profDetails['achievements'] ?? '';
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
              controller: _hospital,
              decoration: _inputDecoration('Hospital'),
            ),
            Padding(
              padding: EdgeInsets.only(top: _padding),
              child: TextFormField(
                controller: _specialization,
                decoration: _inputDecoration('Specialization'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _padding),
              child: TextFormField(
                controller: _department,
                decoration: _inputDecoration('Department'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _padding),
              child: TextFormField(
                controller: _designation,
                decoration: _inputDecoration('Designation'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _padding),
              child: TextFormField(
                controller: _achievements,
                decoration: _inputDecoration('Achievements'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _padding),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _yearsOfExperience,
                decoration: _inputDecoration('Years of Experience'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _padding),
              child: TextFormField(
                controller: _fellowshipMembership,
                decoration: _inputDecoration('Fellowship Membership'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _padding),
              child: ElevatedButton(
                onPressed: () async {
                  int responseCode = await updateDoctorProfessionalDetails(
                      context,
                      widget.profDetails['id'],
                      _hospital.text,
                      _department.text,
                      _specialization.text,
                      _designation.text,
                      _achievements.text,
                      _fellowshipMembership.text,
                      _yearsOfExperience.text);

                  if (responseCode == 200) {
                    Get.off(() => DoctorProfile(
                          index: 1,
                        ));
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
