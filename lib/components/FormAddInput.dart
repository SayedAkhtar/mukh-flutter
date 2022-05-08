import 'package:flutter/material.dart';

class FormAddInput extends StatelessWidget {
  const FormAddInput(this.textLabel,
      {Key? key,
      this.icon,
      this.iconSize = 20,
      this.margin = EdgeInsets.zero,
      this.textEditingController,
      this.textInputType,
      this.readOnly,
      this.onTap,
      this.isImage = false,
      this.onChanged})
      : super(key: key);
  final String textLabel;
  final IconData? icon;
  final double iconSize;
  final EdgeInsets margin;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final bool? readOnly;
  final VoidCallback? onTap;
  final ValueSetter<String>? onChanged;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextField(
        keyboardType: textInputType ?? TextInputType.text,
        readOnly: readOnly ?? false,
        onTap: onTap,
        onChanged: onChanged,
        controller: textEditingController,
        decoration: InputDecoration(
          suffixIcon: isImage ? Icon(Icons.image) : null,
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
