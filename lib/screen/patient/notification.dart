import 'package:flutter/material.dart';

class PatientNotifications extends StatefulWidget {
  const PatientNotifications({Key? key}) : super(key: key);

  @override
  State<PatientNotifications> createState() => _PatientNotificationsState();
}

class _PatientNotificationsState extends State<PatientNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Notification $index',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Text('Subtitle $index'),
            );
          }),
    );
  }
}
