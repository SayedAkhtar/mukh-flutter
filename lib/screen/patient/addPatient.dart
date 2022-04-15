import 'package:flutter/material.dart';
import 'package:mukh/components/StyledInput.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({Key? key}) : super(key: key);

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        title: const Text('Add new patient'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              FormAddInput(
                'First Name *',
                margin: EdgeInsets.only(bottom: 10),
              ),
              FormAddInput(
                'Last Name *',
                margin: EdgeInsets.only(bottom: 10),
              ),
              FormAddInput(
                'Contact Number *',
                margin: EdgeInsets.only(bottom: 10),
              ),
              FormAddInput(
                'Alternate Number *',
                margin: EdgeInsets.only(bottom: 10),
              ),
              FormAddInput(
                'Email Id *',
                margin: EdgeInsets.only(bottom: 10),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: (MediaQuery.of(context).size.width / 2) - 30.0,
                        child: FormAddInput(
                          'DOB *',
                          margin: EdgeInsets.only(
                            bottom: 10,
                          ),
                        )),
                    Container(
                      width: (MediaQuery.of(context).size.width / 2) - 30.0,
                      child: FormAddInput('Age *',
                          margin: EdgeInsets.only(
                            bottom: 10,
                          )),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: (MediaQuery.of(context).size.width / 2) - 30.0,
                        child: FormAddInput(
                          'Gender *',
                          margin: EdgeInsets.only(
                            bottom: 10,
                          ),
                        )),
                    Container(
                        width: (MediaQuery.of(context).size.width / 2) - 30.0,
                        child: FormAddDropdown('B.G', dropdownValue, (True) {
                          print("Down");
                        })),
                  ],
                ),
              ),
              FormAddInput(
                'Email Id *',
                margin: EdgeInsets.only(bottom: 10),
              ),
              FormAddInput(
                'Email Id *',
                margin: EdgeInsets.only(bottom: 10),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class FormAddInput extends StatelessWidget {
  const FormAddInput(this.textLabel,
      {Key? key, this.icon, this.iconSize = 20, this.margin = EdgeInsets.zero})
      : super(key: key);
  final String textLabel;
  final IconData? icon;
  final double iconSize;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextField(
        decoration: InputDecoration(
          fillColor: Color.fromRGBO(239, 245, 255, 1),
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          labelText: textLabel,
        ),
      ),
    );
  }
}

class FormAddDropdown extends StatelessWidget {
  const FormAddDropdown(this.textLabel, this.dropdown, this.onChanged,
      {Key? key, this.icon, this.iconSize = 20, this.margin = EdgeInsets.zero})
      : super(key: key);
  final String textLabel;
  final IconData? icon;
  final double iconSize;
  final EdgeInsets margin;
  final ValueChanged onChanged;
  final dropdown;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: DropdownButtonFormField<String>(
        value: dropdown,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        decoration: InputDecoration(
          fillColor: Color.fromRGBO(239, 245, 255, 1),
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          labelText: textLabel,
        ),
        onChanged: (String) => onChanged,
        items: <String>['One', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
