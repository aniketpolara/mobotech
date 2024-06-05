import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget textFields(
    {TextEditingController? controller,
    bool? enabled,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    List<TextInputFormatter>? inputFormatters,
    String hintText = '',
    Widget? prefixIcon,
    Function()? onTap,
    Color color = Colors.white,
    double? w,
    TextInputType? keyboardType,
    int? maxLines,
    Widget? suffixIcon}) {
  return SizedBox(
      width: w,
      child: TextFormField(
        enabled: enabled,
        onChanged: onChanged,
        validator: validator,
        inputFormatters: inputFormatters,
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          filled: true,
          hintText: hintText,
          fillColor: color,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ));
}
