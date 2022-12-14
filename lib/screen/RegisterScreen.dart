import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/components/StyledInput.dart';
import 'package:mukh/screen/LoginScreen.dart';
import 'package:mukh/screen/RegisterSelection.dart';
import '../AppConstants/constant.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _email,
      _password,
      _confirmPassword,
      _firstName,
      _lastName;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
    _firstName = TextEditingController();
    _lastName = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
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
                RichText(
                    text: TextSpan(
                        text: 'Sign Up ',
                        style: GoogleFonts.sansita(
                            fontSize: 30.0,
                            color: Constant.mainColor,
                            fontWeight: FontWeight.bold),
                        children: const [
                      TextSpan(
                          text: 'to your account',
                          style: TextStyle(color: Colors.black))
                    ])),
                const SizedBox(
                  height: 20,
                ),
                StyledInput(
                  "First Name",
                  controller: _firstName,
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 20,
                ),
                StyledInput(
                  "Last Name",
                  controller: _lastName,
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 20,
                ),
                StyledInput(
                  "Email",
                  controller: _email,
                  icon: Icons.email,
                ),
                const SizedBox(
                  height: 20,
                ),
                StyledInput(
                  "Password",
                  controller: _password,
                  isPassword: true,
                  icon: Icons.lock,
                ),
                const SizedBox(
                  height: 20,
                ),
                StyledInput(
                  "Confirm Password",
                  controller: _confirmPassword,
                  isPassword: true,
                  icon: Icons.check_circle,
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    if (_password.text != _confirmPassword.text) {
                      Get.snackbar(
                        'Passwords don\'t match!',
                        'Please try again.',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else if (_password.text == '') {
                      Get.snackbar(
                        'Password cannot be empty!',
                        'Please try again.',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else {
                      Get.to(() => RegisterSelection(
                          firstName: _firstName.text,
                          lastName: _lastName.text,
                          email: _email.text,
                          password: _password.text));
                    }
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text('Sign Up',
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
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Get.to(() => LoginScreen());
                  },
                  child: RichText(
                      text: TextSpan(
                          text: "Already have an account ? ",
                          style: GoogleFonts.sansita(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                            text: 'Sign In',
                            style: TextStyle(color: Constant.mainColor))
                      ])),
                ),
                const SizedBox(height: 10),
                const Text(
                  'or SignIn With',
                  textAlign: TextAlign.right,
                  textWidthBasis: TextWidthBasis.parent,
                  style: TextStyle(
                      height: 2.5,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Image.asset(
                            'asset/google.png',
                            height: 30.0,
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(180.0),
                                      side: BorderSide(
                                          color: Constant.mainColor,
                                          width: 2))),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(vertical: 10.0))),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Image.asset(
                            'asset/linkedin.png',
                            height: 30.0,
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(180.0),
                                      side: BorderSide(
                                          color: Constant.mainColor,
                                          width: 2))),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(vertical: 10.0))),
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
