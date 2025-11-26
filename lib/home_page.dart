import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.home_filled,
            color: Color(0xff023048),
            size: 100,
          ),
          SizedBox(height: 20,),
          Text('الصفحة الرئيسية', style: TextStyle(color: Color(0xff023048), fontSize: 40, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
