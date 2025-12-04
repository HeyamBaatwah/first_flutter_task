import 'package:files_challenge/Sign_in.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name;
  const HomePage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home', style: TextStyle(fontSize: 30, color: Colors.white),), centerTitle: true, backgroundColor: Colors.blue, foregroundColor: Colors.white,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Hi $name, Welcome Back', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn())
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10)
              ),
              child: Text('Sign Out', style: TextStyle(fontSize: 20, color: Colors.white),),
            )
          ]
        ),
      ),
    );
  }
}
