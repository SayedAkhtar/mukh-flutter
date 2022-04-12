import 'package:flutter/cupertino.dart';

class ProfilepicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator ProfilepicWidget - GROUP
    return Container(
        width: 350,
        height: 350,
        child: Stack(children: <Widget>[
          Positioned(
              top: 125,
              left: 125,
              child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.25),
                    borderRadius: BorderRadius.all(Radius.elliptical(100, 100)),
                  ))),
          Positioned(
              top: 75,
              left: 75,
              child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.15000000596046448),
                    borderRadius: BorderRadius.all(Radius.elliptical(200, 200)),
                  ))),
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: 350,
                  height: 350,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.05000000074505806),
                    borderRadius: BorderRadius.all(Radius.elliptical(350, 350)),
                  ))),
          Positioned(
              top: 150,
              left: 150,
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 2),
                          blurRadius: 4)
                    ],
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                  ))),
          Positioned(
              top: 150,
              left: 150,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(77),
                    topRight: Radius.circular(77),
                    bottomLeft: Radius.circular(77),
                    bottomRight: Radius.circular(77),
                  ),
                ),
                child: Image.asset('asset/avatar-1.png'),
              )),
          Positioned(
              top: 150,
              left: 150,
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(239, 250, 255, 1),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                  ))),
        ]));
  }
}