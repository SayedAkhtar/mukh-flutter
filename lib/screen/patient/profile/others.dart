import 'package:flutter/material.dart';
import 'package:mukh/utils/get_patient/getExtraDetails.dart';

class Others extends StatelessWidget {
  const Others({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPatientExtraDetails(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data as Map;
            return ListView.builder(
                itemCount: data['heading'].length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(data['heading'][index]),
                      subtitle: Text(data['description'][index]),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
