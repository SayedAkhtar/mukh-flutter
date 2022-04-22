import 'package:flutter/material.dart';

class StyledInput extends StatelessWidget {
  const StyledInput(this.textLabel,
      {Key? key,
      this.icon,
      this.iconSize = 20,
      this.controller,
      this.isPassword})
      : super(key: key);
  final String textLabel;
  final IconData? icon;
  final TextEditingController? controller;
  final bool? isPassword;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        prefixIcon:
            Icon(icon, size: iconSize, color: Color.fromRGBO(122, 176, 254, 1)),
        fillColor: Colors.white,
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
    );
  }
}
