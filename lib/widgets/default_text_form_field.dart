import 'package:flutter/material.dart';
import 'package:lab_nerd/utils/app_style.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.onChange,
    this.onSaved,
    required this.textInputType,
    this.width,
    this.height = 70,
    this.borderColor,
    this.cursorAndPrefixIconColor,
    this.focusedColor,
    this.colorText,
    this.textStyle,
    required this.helperText,
    this.onSubmitted,
    this.minLines,
    this.maxLines = 1,
    this.contentPadding = const EdgeInsets.only(left: 10),
  });

  final TextEditingController controller;
  final String? labelText;
  final String helperText;
  final Icon? prefixIcon;
  final bool obscureText;
  final TextInputType textInputType;
  final String hintText;
  final IconButton? suffixIcon;
  final void Function(String)? onChange;
  final void Function(String?)? onSaved;
  final double? width;
  final double height;
  final Color? borderColor;
  final Color? focusedColor;
  final Color? cursorAndPrefixIconColor;
  final Color? colorText;
  final TextStyle? textStyle;
  final void Function(String)? onSubmitted;
  final int? minLines;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          helperText,
          style: textStyle ?? AppStyle.interF14w600,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SizedBox(
            width: 650,
            child: TextFormField(
              onFieldSubmitted: onSubmitted,
              style: const TextStyle(
                color: Colors.black, // تحديد لون النص هنا
              ),
              keyboardType: textInputType,
              onSaved: onSaved,
              onChanged: onChange,
              obscureText: obscureText,
              controller: controller,
              maxLines: maxLines,
              minLines: minLines,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Field Required';
                }
                return null;
              },
              cursorColor: cursorAndPrefixIconColor,
              decoration: InputDecoration(
                counterText: '',
                prefixIconColor: cursorAndPrefixIconColor,
                focusColor: Colors.black,
                labelText: labelText,
                labelStyle: Theme.of(context).textTheme.displaySmall,
                contentPadding: contentPadding,
                prefixIcon: prefixIcon,
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: 14,
                      color: colorText ?? Colors.black54,
                    ),
                suffixIcon: suffixIcon,
                suffixIconColor: Colors.grey,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: focusedColor ?? Colors.blue.shade800,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? Colors.black,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? Colors.black,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
