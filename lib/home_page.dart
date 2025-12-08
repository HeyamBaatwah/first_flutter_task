import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Home', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),), backgroundColor: Colors.deepOrange, foregroundColor: Colors.white,),
      body: Center(
        child: Text('Hi $username', style: TextStyle(color: Colors.deepOrange, fontSize: 30, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
