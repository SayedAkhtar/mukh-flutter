import 'package:flutter/material.dart';

class Constant{
  static Color mainColor = Color.fromRGBO(51, 134, 254, 1);
  static Color secondaryColor = Color.fromRGBO(122, 176, 254, 1);

  static Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.white;
  }
}