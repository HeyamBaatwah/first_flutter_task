
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController  controller;
  final String hint;

  const CustomTextField({super.key, required this.controller, required this.hint});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
          hintText: 'Enter ${widget.hint}',
          filled: true,
          fillColor: Colors.black12,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15)
          )
      ),
    );
  }
}
