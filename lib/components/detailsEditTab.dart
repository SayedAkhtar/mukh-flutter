import 'package:flutter/material.dart';
import 'package:mukh/AppConstants/constant.dart';

class DetailsEditTab extends StatelessWidget {
  DetailsEditTab(
      {Key? key,
      this.icon = const Icon(Icons.settings, color: Colors.white),
      required this.EditTabName})
      : super(key: key);

  final Icon icon;
  final String EditTabName;

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Container(
      height: _width * 0.4,
      width: _width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Constant.secondaryColor,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon,
            Text(
              EditTabName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ]),
    );
  }
}
