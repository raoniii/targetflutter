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
  IconData? prefixIcon; // Adicionado parâmetro para o ícone

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
    this.prefixIcon, // Atualizado para aceitar o ícone opcionalmente
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
      },
      style: TextStyle(
        fontSize: 25,
      ),
      decoration: InputDecoration(
        filled: true,
        // Adiciona o preenchimento
        fillColor: Colors.white,
        // Cor de preenchimento (branco)
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          // Cor da borda quando o campo está focado
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          // Cor da borda quando o campo não está focado
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
        hintStyle: TextStyle(
          fontSize: 16,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon)
            : null, // Usar o ícone se fornecido
      ),
    );
  }
}
