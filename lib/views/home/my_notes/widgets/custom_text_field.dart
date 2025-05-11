import 'package:flutter/material.dart';
import 'package:lab_nerd/views/home/my_notes/widgets/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.initialValue,
    this.controller,
    this.validator,
  });
  final void Function(String)? onChanged;
  final String title;
  final int? maxLines;
  final void Function(String?)? onSaved;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      initialValue: initialValue,
      onChanged: onChanged,
      keyboardType: TextInputType.text,
      onSaved: onSaved,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: const TextStyle(
          color: kPrimary,
        ),
        border: outlineMethod(kPrimary),
        enabledBorder: outlineMethod(Colors.white),
        focusedBorder: outlineMethod(kPrimary),
      ),
    );
  }
}

OutlineInputBorder outlineMethod(color) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: color,
    ),
    borderRadius: BorderRadius.circular(8),
  );
}
