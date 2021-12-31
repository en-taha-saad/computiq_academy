import 'package:flutter/material.dart';

Widget textWidget({
  String? stringText,
  double? fontSize = 15,
  Color? color,
  List<Shadow>? shadows,
  Color? backgroundColor,
  FontWeight? fontWeight,
  TextDecoration? textDecoration,
  double? height,
  TextAlign? textAlign,
  double? letterSpacing,
}) {
  return Text(
    stringText!,
    style: TextStyle(
      shadows: shadows,
      letterSpacing: letterSpacing,
      backgroundColor: backgroundColor,
      color: color,
      overflow: TextOverflow.fade,
      fontFamily: 'Metropolis',
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: textDecoration,
      height: height,
    ),
    textAlign: textAlign,
    softWrap: true,
  );
}
