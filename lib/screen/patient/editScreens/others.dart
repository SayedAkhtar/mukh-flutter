import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mukh/AppConstants/constant.dart';
import 'package:mukh/components/FormAddInput.dart';

class ExtraDetail {
  String heading;
  String detail;
  ExtraDetail(this.heading, this.detail);
}

class EditExtraDetails extends StatefulWidget {
  const EditExtraDetails({Key? key}) : super(key: key);

  @override
  State<EditExtraDetails> createState() => _EditExtraDetailsState();
}

class _EditExtraDetailsState extends State<EditExtraDetails> {
  late final TextEditingController _heading, _detail;
  late List<ExtraDetail> _extraDetailList;

  @override
  void initState() {
    super.initState();
    _heading = TextEditingController();
    _detail = TextEditingController();
    _extraDetailList = [];
  }

  _onPressed() {
    print("Pressed");
    ExtraDetail _ed = ExtraDetail(_heading.value.text, _detail.value.text);

    _extraDetailList.forEach((element) {
      print(element.heading);
    });
    setState(() {
      print(_ed.heading);
      _heading.text = "";
      _detail.text = "";
      _extraDetailList.add(_ed);
    });
  }

  _removeLast() {
    print("Removed");
    _extraDetailList.removeLast();
    ExtraDetail _ed = _extraDetailList.last;
    setState(() {
      _heading.text = _ed.heading;
      _detail.text = _ed.detail;
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
                  heading: _extraDetailList[i].heading,
                  detail: _extraDetailList[i].detail,
                  onPressed: _removeLast,
                ),
              FormRepeater(
                heading: _heading,
                detail: _detail,
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
  const FormRepeater({Key? key, this.heading, this.detail, this.onPressed})
      : super(key: key);

  final TextEditingController? heading;
  final TextEditingController? detail;
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
                  textEditingController: heading,
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
            height: 100.0,
            child: TextFormField(
              maxLines: 10,
              decoration: _inputDecoration(''),
              controller: detail,
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
      required this.heading,
      required this.detail,
      required this.onPressed})
      : super(key: key);

  final String heading;
  final String detail;
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
                    child: Text('${heading}'),
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
          Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.only(top: 10.0),
              height: 100.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text('$detail')),
        ],
      ),
    );
  }
}
