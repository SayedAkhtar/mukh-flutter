import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/components/FormAddInput.dart';
import 'package:mukh/screen/patient/editScreens/congenitalDentalRecord.dart';

class CongenitalSectionSelection extends StatelessWidget {
  CongenitalSectionSelection({Key? key}) : super(key: key);
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

  TextEditingController _condition =
      new TextEditingController(text: "Congenital");

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
          title: const Text('Upload Dental Records'),
          backgroundColor: Constant.mainColor,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormAddInput(
                'Condition',
                decoration: _inputDecoration("Condition"),
                textEditingController: _condition,
                readOnly: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Text(
                  "Select The Part",
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  child: Image.asset(
                    'asset/congenital-image-1.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 310,
                  height: 310,
                  child: Stack(
                    children: [
                      Image.asset(
                        'asset/congenital-image-2.png',
                        width: 310,
                        height: 310,
                      ),
                      Positioned(
                        top: 18,
                        left: 40,
                        child: InkWell(
                          onTap: () {
                            Get.to(
                                () => CongenitalDentalRecords("first_section"));
                          },
                          child: Container(
                            height: 144,
                            width: 82,
                            color: Colors.blueAccent.withOpacity(0.3),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 18,
                        left: 124,
                        child: InkWell(
                          onTap: () {
                            Get.to(() =>
                                CongenitalDentalRecords("second_section"));
                          },
                          child: Container(
                            height: 144,
                            width: 52,
                            color: Colors.redAccent.withOpacity(0.3),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 18,
                        left: 180,
                        child: InkWell(
                          onTap: () {
                            Get.to(
                                () => CongenitalDentalRecords("third_section"));
                          },
                          child: Container(
                            height: 144,
                            width: 82,
                            color: Colors.green.withOpacity(0.3),
                          ),
                        ),
                      ),
                      //------------ Middle Buttons ---------//
                      Positioned(
                        top: 164,
                        left: 40,
                        child: InkWell(
                          onTap: () {
                            Get.to(() =>
                                CongenitalDentalRecords("fourth_section"));
                          },
                          child: Container(
                            height: 58,
                            width: 82,
                            color: Colors.blueAccent.withOpacity(0.3),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 164,
                        left: 124,
                        child: InkWell(
                          onTap: () {
                            Get.to(
                                () => CongenitalDentalRecords("fifth_section"));
                          },
                          child: Container(
                            height: 58,
                            width: 52,
                            color: Colors.redAccent.withOpacity(0.3),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 164,
                        left: 180,
                        child: InkWell(
                          onTap: () {
                            Get.to(
                                () => CongenitalDentalRecords("sixth_section"));
                          },
                          child: Container(
                            height: 58,
                            width: 82,
                            color: Colors.green.withOpacity(0.3),
                          ),
                        ),
                      ),
                      //------------ Bottom Buttons ---------//
                      Positioned(
                        top: 225,
                        left: 40,
                        child: InkWell(
                          onTap: () {
                            Get.to(() =>
                                CongenitalDentalRecords("seventh_section"));
                          },
                          child: Container(
                            height: 68,
                            width: 82,
                            color: Colors.blueAccent.withOpacity(0.3),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 225,
                        left: 124,
                        child: InkWell(
                          onTap: () {
                            Get.to(
                                () => CongenitalDentalRecords("eight_section"));
                          },
                          child: Container(
                            height: 68,
                            width: 52,
                            color: Colors.redAccent.withOpacity(0.3),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 225,
                        left: 180,
                        child: InkWell(
                          onTap: () {
                            Get.to(
                                () => CongenitalDentalRecords("ninth_section"));
                          },
                          child: Container(
                            height: 68,
                            width: 82,
                            color: Colors.green.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 310,
                  height: 310,
                  child: Stack(
                    children: [
                      Image.asset(
                        'asset/congenital-image-3.png',
                        width: 310,
                        height: 310,
                      ),
                      Positioned(
                        top: 18,
                        left: 40,
                        child: InkWell(
                          onTap: () {
                            Get.to(
                                () => CongenitalDentalRecords("tenth_section"));
                          },
                          child: Container(
                            height: 114,
                            width: 82,
                            color: Colors.blueAccent.withOpacity(0.3),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 18,
                        left: 124,
                        child: InkWell(
                          onTap: () {
                            Get.to(() =>
                                CongenitalDentalRecords("eleventh_section"));
                          },
                          child: Container(
                            height: 114,
                            width: 52,
                            color: Colors.redAccent.withOpacity(0.3),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 18,
                        left: 180,
                        child: InkWell(
                          onTap: () {
                            Get.to(() =>
                                CongenitalDentalRecords("twelveth_section"));
                          },
                          child: Container(
                            height: 114,
                            width: 82,
                            color: Colors.green.withOpacity(0.3),
                          ),
                        ),
                      ),
                      //------------ Middle Buttons ---------//
                      Positioned(
                        top: 134,
                        left: 40,
                        child: InkWell(
                          onTap: () {
                            Get.to(() =>
                                CongenitalDentalRecords("thirteenth_section"));
                          },
                          child: Container(
                            height: 38,
                            width: 82,
                            color: Colors.blueAccent.withOpacity(0.3),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 134,
                        left: 124,
                        child: InkWell(
                          onTap: () {
                            Get.to(() =>
                                CongenitalDentalRecords("fourteenth_section"));
                          },
                          child: Container(
                            height: 38,
                            width: 52,
                            color: Colors.redAccent.withOpacity(0.3),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 134,
                        left: 180,
                        child: InkWell(
                          onTap: () {
                            Get.to(() =>
                                CongenitalDentalRecords("fifteenth_section"));
                          },
                          child: Container(
                            height: 38,
                            width: 82,
                            color: Colors.green.withOpacity(0.3),
                          ),
                        ),
                      ),
                      //------------ Bottom Buttons ---------//
                      Positioned(
                        top: 184,
                        left: 40,
                        child: InkWell(
                          onTap: () {
                            Get.to(() =>
                                CongenitalDentalRecords("sisteenth_section"));
                          },
                          child: Container(
                            height: 68,
                            width: 82,
                            color: Colors.blueAccent.withOpacity(0.3),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 184,
                        left: 124,
                        child: InkWell(
                          onTap: () {
                            Get.to(() =>
                                CongenitalDentalRecords("seventh_section"));
                          },
                          child: Container(
                            height: 68,
                            width: 52,
                            color: Colors.redAccent.withOpacity(0.3),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 184,
                        left: 180,
                        child: InkWell(
                          onTap: () {
                            Get.to(() =>
                                CongenitalDentalRecords("eighteenth_section"));
                          },
                          child: Container(
                            height: 68,
                            width: 82,
                            color: Colors.green.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
