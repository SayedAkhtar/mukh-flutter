import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/components/FormAddInput.dart';
import 'package:mukh/controller/PatientController.dart';
class Medicine {
  String name;
  String from;
  String to;
  Medicine(this.name, this.from, this.to);
}

class UpdateNewMedicine extends StatefulWidget {
  const UpdateNewMedicine({Key? key}) : super(key: key);

  @override
  State<UpdateNewMedicine> createState() => _UpdateNewMedicineState();
}

class _UpdateNewMedicineState extends State<UpdateNewMedicine> {
  late final TextEditingController _name, _start, _end;
  late List<Medicine> _extraDetailList;
  PatientController patient = Get.find();
  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
    _start = TextEditingController();
    _end = TextEditingController();
    _extraDetailList = [];
  }

  _onPressed() {
    print("Pressed");
    Medicine _ed = Medicine(_name.value.text, _start.value.text, _end.value.text);

    _extraDetailList.forEach((element) {
      print(element.name);
    });
    setState(() {
      print(_ed.name);
      _name.text = "";
      _start.text = "";
      _end.text = "";
      _extraDetailList.add(_ed);
    });
  }

  _removeLast() {
    print("Removed");
    _extraDetailList.removeLast();
    Medicine _ed = _extraDetailList.last;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            ),
            title: const Text('Add new patient'),
            backgroundColor: Constant.mainColor,
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(16.0),
            child: Form(
              child: ListView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  for (var i = 0; i < _extraDetailList.length; i++)
                    StaticFormRepeater(
                      name: _extraDetailList[i].name,
                      start: _extraDetailList[i].from,
                      end: _extraDetailList[i].to,
                      onPressed: _removeLast,
                    ),
                  FormRepeater(
                    name: _name,
                    start: _start,
                    end: _end,
                    onPressed: _onPressed,
                  ),
                  ElevatedButton(
                    onPressed: () async {},
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text('Update',
                          style: TextStyle(fontSize: 20.0),
                          textAlign: TextAlign.center),
                    ),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(180.0),
                            )),
                        foregroundColor:
                        MaterialStateProperty.resolveWith(Constant.getColor),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 15.0))),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class FormRepeater extends StatelessWidget {
  const FormRepeater({Key? key, this.name, this.start, this.end, this.onPressed})
      : super(key: key);

  final TextEditingController? name;
  final TextEditingController? start;
  final TextEditingController? end;
  final Function? onPressed;

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey),
      floatingLabelStyle: TextStyle(color: Constant.mainColor),
      fillColor: Colors.transparent,
      filled: false,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey)),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: Colors.grey),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: FormAddInput(
                  'Heading',
                  textEditingController: name,
                  textInputType: TextInputType.text,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: _inputDecoration('Heading *'),
                ),
              ),
              Flexible(
                child: InkWell(
                  onTap: () {
                    onPressed!();
                  },
                  child: Container(
                    width: 50,
                    height: 55,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Constant.secondaryColor.withOpacity(0.4)),
                    child: Icon(Icons.add),
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: FormAddInput(
                    'From',
                    textEditingController: start,
                    readOnly: true,
                    textInputType: TextInputType.datetime,
                    decoration: _inputDecoration("From"),
                    onChanged: (value) {
                      // if (value != widget.dosageEnd) {
                      //   setState(() {
                      //     isBtnDisabled = false;
                      //   });
                      // } else {
                      //   setState(() {
                      //     isBtnDisabled = true;
                      //   });
                      // }
                    },
                    onTap: () async {
                      await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030))
                          .then((value) {
                        if (value != null) {
                          start?.text =
                          '${value.year}-${value.month}-${value.day}';
                        }
                      });
                    },
                  ),
                ),
                SizedBox(width: 20,),
                Flexible(
                  flex: 1,
                  child: FormAddInput(
                    'To',
                    textEditingController: end,
                    readOnly: true,
                    textInputType: TextInputType.datetime,
                    decoration: _inputDecoration("To"),
                    onChanged: (value) {
                      // if (value != widget.dosageEnd) {
                      //   setState(() {
                      //     isBtnDisabled = false;
                      //   });
                      // } else {
                      //   setState(() {
                      //     isBtnDisabled = true;
                      //   });
                      // }
                    },
                    onTap: () async {
                      await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030))
                          .then((value) {
                        if (value != null) {
                          end?.text =
                          '${value.year}-${value.month}-${value.day}';
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StaticFormRepeater extends StatelessWidget {
  StaticFormRepeater(
      {Key? key,
        required this.name,
        required this.start,
        required this.end,
        required this.onPressed})
      : super(key: key);

  final String name;
  final String start;
  final String end;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text('${name}'),
                  )),
              Flexible(
                child: InkWell(
                  onTap: () {
                    onPressed();
                  },
                  child: Container(
                    width: 50,
                    height: 55,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Constant.secondaryColor.withOpacity(0.4)),
                    child: Icon(Icons.remove),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.only(top: 10.0),
                  height: 55.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text('$start'),
                ),
              ),
              SizedBox(width: 20),
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.only(top: 10.0),
                  height: 55.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text('$end'),
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}
