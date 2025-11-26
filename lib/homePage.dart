import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name;
  const HomePage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),), backgroundColor: Colors.deepOrange, foregroundColor: Colors.white,),
      body: Center(
        child: Text('Hi $name', style: TextStyle(color: Colors.deepOrange, fontSize: 40, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
