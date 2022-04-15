import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  final VoidCallback func;
  final String heading;

  const SectionHeading(this.heading, this.func, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: TextStyle(fontSize: 20.0),
          ),
          GestureDetector(
            onTap: func,
            child: const Text(
              'More >',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }
}
