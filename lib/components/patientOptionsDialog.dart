import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            // Get.to(EditDetailsTabs());
          },
          child: Text(
            'Edit Details',
            style: _textStyle,
          )),
      TextButton(
          onPressed: () {
            // Get.off(() => EditMedicines());
          },
          child: Text(
            'Edit Medicines',
            style: _textStyle,
          )),
      TextButton(
          onPressed: () {}, child: Text('Refer / Accept', style: _textStyle)),
      TextButton(
          onPressed: () {}, child: Text('Write Review', style: _textStyle)),
    ]),
  );
}
