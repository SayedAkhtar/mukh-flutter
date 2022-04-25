import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mukh/screen/consultant/landingPage.dart';
import 'package:mukh/utils/signup.dart';

class RegisterSelection extends StatefulWidget {
  const RegisterSelection(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password})
      : super(key: key);

  final String firstName, lastName, email, password;

  @override
  State<RegisterSelection> createState() => _RegisterSelectionState();
}

class _RegisterSelectionState extends State<RegisterSelection> {
  @override
  Widget build(BuildContext context) {
    double _buttonWidth = MediaQuery.of(context).size.width / 2 - 50;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(239, 245, 255, 1),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'asset/logo.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                RichText(
                    text: TextSpan(
                  text: 'Register As',
                  style: GoogleFonts.sansita(
                      fontSize: 36.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
                const SizedBox(
                  height: 80,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Container(
                        height: _buttonWidth,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(51, 134, 254, 0.75),
                                offset: Offset(0, 8),
                                blurRadius: 20)
                          ],
                        ),
                        child: TextButton(
                          onPressed: () async {
                            final responseCode = await signup(
                                context,
                                widget.email,
                                widget.password,
                                'specialist',
                                widget.firstName,
                                widget.lastName);

                            if (responseCode == 201) {
                              Get.offAll(() => DoctorLandingPage());
                            }
                          },
                          child: const Center(
                            child: Text(
                              'An Expert Consultant',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 24.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )),
                      const SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        child: Container(
                          height: _buttonWidth,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(51, 134, 254, 0.75),
                                  offset: Offset(0, 8),
                                  blurRadius: 20),
                            ],
                          ),
                          child: TextButton(
                            onPressed: () async {
                              final responseCode = await signup(
                                  context,
                                  widget.email,
                                  widget.password,
                                  'rural',
                                  widget.firstName,
                                  widget.lastName);
                              if (responseCode == 201) {
                                Get.offAll(() => DoctorLandingPage());
                              }
                            },
                            child: const Center(
                              child: Text(
                                'A Rural Doctor',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 24.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
