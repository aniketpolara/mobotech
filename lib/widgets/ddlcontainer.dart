import 'package:flutter/material.dart';
import 'package:moboshop/utils/colors.dart';

Widget textfieldContainer(Widget? child, {double? h, double? w}) {
  return Container(
    height: h,
    width: w,
    decoration: BoxDecoration(
        color: textfieldgrey,
        border: Border.all(color: Colors.black54),
        boxShadow: const [
          BoxShadow(
            // offset: Offset(0.5, 2),
            color: Colors.black26,
            //blurRadius: 10,
            //spreadRadius: 0.5
          )
        ],
        borderRadius: BorderRadius.circular(22)),
    child: child,
  );
}
