import 'package:flutter/material.dart';
import 'package:lab_nerd/views/main/screens/home/my_notes/widgets/constants.dart';

class AddNoteTextFormField extends StatelessWidget {
  const AddNoteTextFormField({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.initialValue,
    this.controller,
    this.validator,
    this.textColor,
  });
  final void Function(String)? onChanged;
  final String title;
  final int? maxLines;
  final void Function(String?)? onSaved;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: TextStyle(color: textColor ?? Colors.white),
      initialValue: initialValue,
      onChanged: onChanged,
      cursorColor: textColor ?? Colors.white,
      keyboardType: TextInputType.text,
      onSaved: onSaved,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: const TextStyle(
          color: kPrimary,
        ),
        border: outlineMethod(textColor ?? kPrimary),
        enabledBorder: outlineMethod(textColor ?? Colors.white),
        focusedBorder: outlineMethod(textColor ?? kPrimary),
      ),
    );
  }
}

OutlineInputBorder outlineMethod(Color color) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: color,
    ),
    borderRadius: BorderRadius.circular(8),
  );
}
