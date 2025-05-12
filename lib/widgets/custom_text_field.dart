import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.controller,
  });

  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final TextEditingController? controller;
  final String? hintText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: kPrimaryColor),
        focusedBorder: buildBorder(kPrimaryColor),
        enabledBorder: buildBorder(),
        border: buildBorder(),
      ),
      maxLines: maxLines,
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
