import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.account_box,
            color: Color(0xff229ebd),
            size: 100,
          ),
          SizedBox(height: 20,),
          Text('صفحة الحساب', style: TextStyle(color: Color(0xff229ebd), fontSize: 40, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
