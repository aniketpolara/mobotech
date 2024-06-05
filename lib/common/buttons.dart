import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

//animatio button
Widget animatedButton(
    {double h = 0,
    double w = 0,
    double? fontsize,
    String text = '',
    Color? fontcolor,
    void Function()? onPress,
    double borderWidth = 0,
    Color backgroundColor = Colors.transparent,
    Color selectedTextColor = Colors.transparent,
    Color borderColor = Colors.transparent,
    double borderRadius = 0,
    bool isReverse = false,
    TransitionType transitionType = TransitionType.LEFT_TO_RIGHT}) {
  return AnimatedButton(
      height: h,
      width: w,
      text: text,
      isReverse: isReverse,
      selectedTextColor: selectedTextColor,
      transitionType: transitionType,
      textStyle: TextStyle(fontSize: fontsize, color: fontcolor),
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      borderRadius: borderRadius,
      borderWidth: borderWidth,
      onPress: onPress);
}

Widget btnUpdate({
  Widget? child,
  Function()? onPressed,
  Color? color,
  double? h,
  double? w,
}) {
  return MaterialButton(
    onPressed: onPressed,
    color: color,
    height: h,
    minWidth: w,
    child: child,
  );
}

Widget matiralbutton({Function()? onpressed, Widget? child, double? height}) {
  return MaterialButton(
    onPressed: onpressed,
    height: height,
    child: child,
  );
}

Widget iconbutton({void Function()? onPressed, IconData? icon}) {
  return IconButton(onPressed: onPressed, icon: Icon(icon));
}
