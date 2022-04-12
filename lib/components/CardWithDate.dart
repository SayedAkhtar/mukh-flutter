import 'package:flutter/material.dart';

import '../AppConstants/constant.dart';

class CardWithDate extends StatelessWidget {
  final date;
  final patientId;
  final name;

  const CardWithDate(String this.name, String this.patientId, String this.date, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 300,
      margin: EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
          color: Constant.secondaryColor,
          borderRadius: BorderRadius.circular(12.0)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Image.asset('asset/avatar-2.png'),
                const SizedBox(
                  width: 20.0,
                ),
                RichText(
                    text: TextSpan(
                        text: "${name} \n",
                        style: const TextStyle(fontSize: 20.0, fontFamily: 'Sansation'),
                        children: [
                          TextSpan(
                              text: "Patient Id: ${patientId}",
                              style: const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5))
                        ]))
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              width: 500.0,
              child: Container(
                height: 50.0,
                padding:
                const EdgeInsets.symmetric(horizontal: 24.0),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.2),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "${date}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.white),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
