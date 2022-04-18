import 'package:flutter/material.dart';
import 'package:mukh/AppConstants/constant.dart';

class DentalRecordsCardPatient extends StatelessWidget {
  const DentalRecordsCardPatient({
    Key? key,
    required this.isActive,
    required this.refDocName,
    required this.diagDocName,
    required this.date,
  }) : super(key: key);

  final bool isActive;
  final String refDocName, diagDocName, date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: isActive ? Constant.secondaryColor : Colors.grey[300],
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: RichText(
                text: TextSpan(
                  text: 'Referred by: ',
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                  children: <TextSpan>[
                    TextSpan(
                        text: refDocName, style: TextStyle(fontSize: 20.0)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
              child: RichText(
                text: TextSpan(
                  text: 'Diagnosed by: ',
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                  children: <TextSpan>[
                    TextSpan(
                        text: diagDocName, style: TextStyle(fontSize: 20.0)),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: isActive ? Constant.mainColor : Colors.grey[500],
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_month_rounded,
                    size: 32.0,
                    color: Colors.white,
                  ),
                  Text(
                    '  ${date}',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
