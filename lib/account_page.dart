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
          SizedBox(height: 100,),
          Icon(
            Icons.account_circle,
            color: Color(0xff0343cb),
            size: 120,
          ),
          Text('الحساب', style:  TextStyle(color: Color(0xff0343cb), fontSize: 40, fontWeight: FontWeight.bold),),
          SizedBox(height: 50,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
              ),
            ),
          )
        ],
      ),
    );
  }
}
