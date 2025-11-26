import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.settings,
            color: Color(0xffffb702),
            size: 100,
          ),
          SizedBox(height: 20,),
          Text('صفحة الاعدادات', style: TextStyle(color: Color(0xffffb702), fontSize: 40, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
