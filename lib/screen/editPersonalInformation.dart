import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';

class EditPersonalDetails extends StatefulWidget {
  const EditPersonalDetails({Key? key}) : super(key: key);

  @override
  State<EditPersonalDetails> createState() => _EditPersonalDetailsState();
}

class _EditPersonalDetailsState extends State<EditPersonalDetails> {
  late TextEditingController _contactNo, _alternateContactNo, _email, _address;

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Constant.mainColor),
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Constant.mainColor)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Constant.mainColor)),
    );
  }

  @override
  void initState() {
    _contactNo = TextEditingController();
    _alternateContactNo = TextEditingController();
    _email = TextEditingController();
    _address = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
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
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(_padding),
              child: Column(children: [
                TextFormField(
                  controller: _contactNo,
                  keyboardType: TextInputType.number,
                  decoration: _inputDecoration('Contact Number'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: _padding),
                  child: TextFormField(
                    controller: _alternateContactNo,
                    keyboardType: TextInputType.number,
                    decoration: _inputDecoration('Alternate Contact Number'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: _padding),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _email,
                    decoration: _inputDecoration('Email'),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<String>(
                    decoration: _inputDecoration('B. G.'),
                    isExpanded: true,
                    // borderRadius: BorderRadius.all(Radius.circular(10)),
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
                    onChanged: (_) {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _padding),
                  child: TextFormField(
                    controller: _address,
                    decoration: _inputDecoration('Address'),
                  ),
                ),
              ]),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              width: _width,
              decoration: BoxDecoration(
                color: Constant.mainColor,
              ),
              child: Text(
                'Update',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
