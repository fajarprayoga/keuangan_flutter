import 'package:flutter/material.dart';
import 'package:keuangan_flutter/app/core/constans/value.dart';

class FormInput extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  const FormInput(
      {super.key,
      required String this.hintText,
      TextEditingController? this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: colors['backgroundInput'],
        filled: true,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2,
              color: Colors.blue), // Warna border saat mendapatkan fokus
        ),
      ),
    );
  }
}
