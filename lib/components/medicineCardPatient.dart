import 'package:flutter/material.dart';

class MedicineCardPatient extends StatelessWidget {
  const MedicineCardPatient(
      {Key? key,
      required this.isActive,
      required this.name,
      required this.startDate,
      required this.endDate,
      required this.dosage})
      : super(key: key);

  final bool isActive;
  final String name, startDate, endDate;
  final int dosage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue[300] : Colors.grey[300],
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(name,
                    style: TextStyle(color: Colors.white, fontSize: 20.0)),
                SizedBox(
                  width: 100,
                  height: 40,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dosage,
                      itemBuilder: (context, index) {
                        return Icon(
                          Icons.circle,
                          color: Colors.white,
                        );
                      }),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.white,
                    ),
                    Text(
                      startDate,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.white,
                    ),
                    Text(
                      endDate,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
