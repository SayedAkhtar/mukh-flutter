import 'package:flutter/material.dart';
import 'package:mukh/components/CardWithButton.dart';

class ReferStatus extends StatelessWidget {
  const ReferStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, index) {
          return CardWithButton("Sayed Akhtar", "87655678", 'Wednesday', (){});
      },),
    );
  }
}
