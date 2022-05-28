import 'package:flutter/material.dart';
import 'package:mukh/AppConstants/constant.dart';

class Availability extends StatelessWidget {
  const Availability({Key? key, required this.profDetails}) : super(key: key);

  final Map profDetails;

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final String _availability = profDetails['available_days'] ?? '';
    List<String> _days = _availability.split(',');
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 12.0, bottom: 12.0),
            child: const Text(
              'Week',
              softWrap: true,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.0),
            width: _width,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _days.contains('Sun')
                        ? Constant.mainColor
                        : Colors.grey,
                  ),
                  child: Center(
                    child: Text(
                      'S',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(13.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _days.contains('Mon')
                        ? Constant.mainColor
                        : Colors.grey,
                  ),
                  child: Center(
                    child: Text(
                      'M',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _days.contains('Tues')
                        ? Constant.mainColor
                        : Colors.grey,
                  ),
                  child: Center(
                    child: Text(
                      'T',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(13.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _days.contains('Wed')
                        ? Constant.mainColor
                        : Colors.grey,
                  ),
                  child: Center(
                    child: Text(
                      'W',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _days.contains('Thurs')
                        ? Constant.mainColor
                        : Colors.grey,
                  ),
                  child: Center(
                    child: Text(
                      'T',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _days.contains('Fri')
                        ? Constant.mainColor
                        : Colors.grey,
                  ),
                  child: Center(
                    child: Text(
                      'F',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _days.contains('Sat')
                        ? Constant.mainColor
                        : Colors.grey,
                  ),
                  child: Center(
                    child: Text(
                      'S',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 12.0, bottom: 12.0),
            child: const Text(
              'Time',
              softWrap: true,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              children: [
                Icon(
                  Icons.timer,
                  color: Constant.mainColor,
                  size: 36,
                ),
                (profDetails['available_from'] != null && profDetails['available_to'] !=null)?
                Text(
                    '\t' +
                        profDetails['available_from'].toString() +
                        ' to ' +
                        profDetails['available_to'].toString(),
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        color: Constant.mainColor))
                :Text(" No Avaibility",style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    color: Constant.mainColor)),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 24.0, left: 12.0, bottom: 12.0),
          //   child: const Text(
          //     'Note',
          //     softWrap: true,
          //     style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          //   ),
          // ),
        ],
      ),
    );
  }
}
