import 'package:flutter/material.dart';
import 'package:moboshop/utils/colors.dart';

Widget dropdownButton({
  bool isExpanded = false,
  List<DropdownMenuItem<dynamic>>? items,
  Function(dynamic)? onChanged,
  dynamic value,
  Widget? hinttext,
}) {
  return DropdownButton(
    hint: hinttext,
    alignment: Alignment.centerLeft,
    value: value,
    items: items,
    menuMaxHeight: 250,
    isExpanded: isExpanded,
    onChanged: onChanged,
    itemHeight: kMinInteractiveDimension,
    dropdownColor: colortextfields,
    elevation: 0,
  );
}
