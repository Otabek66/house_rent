import 'package:flutter/material.dart';

class StyledText {
  static Text styledText(text,double size,{Color? color,FontWeight? fontWeight} ){
      return Text(
        text,
        style: TextStyle(color: color ?? Colors.white,
        fontSize: size,
        fontWeight: fontWeight ?? FontWeight.normal 
        ),
      );
  }
}