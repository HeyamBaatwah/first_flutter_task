import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool mode;
  const CustomField({
    super.key,
    required this.controller,
    required this.label,
    required this.mode
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: mode,
      decoration: InputDecoration(
        label: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(label, style: TextStyle(color: Colors.deepOrange.shade300, fontSize: 18, fontWeight: FontWeight.bold),),
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.deepOrange, width: 3)
        ),
      ),
    );
  }
}