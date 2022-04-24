import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/screen/RegisterScreen.dart';
import 'package:mukh/screen/RegisterSelection.dart';
import 'package:mukh/screen/consultant/landingPage.dart';
import '../AppConstants/constant.dart';
import '../utils/login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _email, _password;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
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
                const SizedBox(
                  height: 30,
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
                TextField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email,
                        color: Color.fromRGBO(122, 176, 254, 1)),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 1))),
                    labelText: 'Email Address',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock,
                        color: Color.fromRGBO(122, 176, 254, 1)),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 1))),
                    labelText: 'Password',
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    // await login(context, _email.text, _password.text);
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      'Forgot Password ?',
                      textAlign: TextAlign.right,
                      textWidthBasis: TextWidthBasis.parent,
                      style: TextStyle(height: 2.5),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    int responseCode =
                        await login(context, _email.text, _password.text);
                    if (responseCode == 200) {
                      Get.off(() => DoctorLandingPage());
                    } else {
                      Get.snackbar('Error!',
                          'Invalid Credentials or Something went wrong',
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text('Sign In',
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
                  onTap: () => Get.to(RegisterScreen()),
                  child: RichText(
                      text: TextSpan(
                          text: "Don't have an account? ",
                          style: GoogleFonts.sansita(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(color: Constant.mainColor)),
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
