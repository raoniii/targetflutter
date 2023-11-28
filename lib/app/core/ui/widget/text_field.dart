import 'package:flutter/material.dart';

class TargetTextField extends StatelessWidget {
  String label;
  String hint;
  bool password;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode nextFocus;
  IconData? prefixIcon;
  TextStyle? hintTextStyle;
  Function(String)? onFieldSubmitted;
  Color? iconColor;
  double? width;
  double? height;
  EdgeInsetsGeometry? contentPadding; // Novo parâmetro para contentPadding

  TargetTextField(
      this.label,
      this.hint, {
        this.password = false,
        required this.controller,
        required this.validator,
        required this.keyboardType,
        required this.textInputAction,
        required this.focusNode,
        required this.nextFocus,
        this.prefixIcon,
        this.hintTextStyle,
        this.onFieldSubmitted,
        this.iconColor,
        this.width,
        this.height,
        this.contentPadding,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
        if (onFieldSubmitted != null) {
          onFieldSubmitted!(text);
        }
      },
      style: TextStyle(
        fontSize: 25,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(16),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 25,
          color: Colors.grey,
        ),
        hintText: hint,
        hintStyle: hintTextStyle ?? TextStyle(fontSize: 16),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: iconColor) : null,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: width ?? 0, vertical: height ?? 0),
      ),
    );
  }
}
