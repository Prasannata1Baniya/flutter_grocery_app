import 'package:flutter/material.dart';

class TextStyles{

  static const heading1= TextStyle(
    color: Colors.black,
    fontSize: 50,
    fontWeight: FontWeight.bold,
  );

  static const bodyText= TextStyle(
    color: Colors.black,
    fontSize: 27,
    fontWeight: FontWeight.normal,
  );

  static const subTitle= TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );




  static TextStyle whiteTextFieldStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    );
  }


  static TextStyle greyTextFieldStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    );
  }
}