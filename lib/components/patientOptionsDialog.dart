import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/screen/consultant/editDetailsTabs.dart';

Future<void> getDialog() async {
  TextStyle _textStyle = TextStyle(
    fontSize: 20.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  await Get.defaultDialog(
    radius: 10.0,
    title: 'Patient Options',
    contentPadding: const EdgeInsets.all(20.0),
    content: Column(children: [
      TextButton(
          onPressed: () {
            Get.to(EditDetailsTabs());
          },
          child: Text(
            'Edit Details',
            style: _textStyle,
          )),
      TextButton(
          onPressed: () {}, child: Text('Refer / Accept', style: _textStyle)),
      TextButton(
          onPressed: () {}, child: Text('Write Review', style: _textStyle)),
    ]),
  );
}
