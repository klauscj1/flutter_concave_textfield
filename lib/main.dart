import 'package:flutter/material.dart';

import 'package:prueba_input/textfieldform_dark.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final backgrounDark = BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(232, 237, 243, 0.05),
          offset: Offset(12, 20),
          blurRadius: 56,
        ),
        BoxShadow(
          color: Color.fromRGBO(2, 3, 3, 0.05),
          offset: Offset(36, 12),
          blurRadius: 64,
        ),
        BoxShadow(
            color: Color.fromRGBO(248, 249, 249, 0.05),
            offset: Offset(-16, -6),
            blurRadius: 80,
            spreadRadius: -80),
      ],
      borderRadius: BorderRadius.all(const Radius.circular(24.0)),
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [
            -0.3,
            .84
          ],
          colors: [
            Color.fromRGBO(53, 58, 64, .95),
            Color.fromRGBO(18, 20, 22, .95),
          ]));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Scaffold(
            body: Container(
          width: double.infinity,
          decoration: backgrounDark,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InnerShadowText(),
              SizedBox(
                height: 20,
              ),
              InnerShadowText()
            ],
          ),
        )));
  }
}
