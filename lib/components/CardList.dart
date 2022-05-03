import 'package:flutter/material.dart';

import '../AppConstants/constant.dart';

class CardList extends StatelessWidget {
  final patientId;
  final name;
  final String? imagePath;

  const CardList(String this.name, String this.patientId,
      {Key? key, this.imagePath = 'avatars/default.png'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          color: Constant.secondaryColor.withAlpha(80),
          borderRadius: BorderRadius.circular(12.0)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    Constant.baseUrl + 'storage/' + imagePath!,
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: RichText(
                      text: TextSpan(
                          text: "${name} \n",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Sansation',
                              color: Constant.mainColor),
                          children: [
                        TextSpan(
                            text: "ID: ${patientId}",
                            style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                height: 1.5))
                      ])),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
