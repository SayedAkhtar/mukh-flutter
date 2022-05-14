import 'package:flutter/material.dart';
import 'package:mukh/AppConstants/constant.dart';

class MedicineCardPatient extends StatelessWidget {
  const MedicineCardPatient(
      {Key? key,
      required this.isActive,
      required this.name,
      required this.startDate,
      required this.endDate,
      required this.dosage,
      required this.instructions})
      : super(key: key);

  final bool isActive;
  final String name, startDate, endDate, dosage, instructions;

  @override
  Widget build(BuildContext context) {
    String instructions = this.instructions;
    if (instructions.length > 15) {
      instructions = instructions.substring(0, 15) + '...';
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: isActive ? Constant.secondaryColor : Colors.grey[300],
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(name + '\n' + instructions,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                ),
                SizedBox(
                  width: 150,
                  height: 40,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: int.parse(dosage.split('')[0]),
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
