// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CuidapetTextFormField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextNV;

  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  CuidapetTextFormField({
    super.key,
    required this.label,
    this.obscureText = false,
    this.controller,
    this.validator,
  }) : _obscureTextNV = ValueNotifier<bool>(obscureText);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextNV,
      builder: (context, obscureTextVNValue, child) => TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscureTextVNValue,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            // gapPadding: 0,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            // gapPadding: 0,
            borderSide: const BorderSide(
              color: Colors.green,
            ),
          ),
          suffixIcon: obscureText
              ? IconButton(
                  onPressed: () => _obscureTextNV.value = !obscureTextVNValue,
                  icon: Icon(
                    obscureTextVNValue ? Icons.lock_outline : Icons.lock_open,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
