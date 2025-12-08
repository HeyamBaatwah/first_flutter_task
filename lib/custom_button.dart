import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function action;
  const CustomButton({
    super.key,
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          action();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),

        ),
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20),),
      ),
    );
  }
}