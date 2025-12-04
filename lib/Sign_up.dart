import 'package:files_challenge/Home_page.dart';
import 'package:files_challenge/Sign_in.dart';
import 'package:files_challenge/files_methods.dart';
import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up', style: TextStyle(fontSize: 30, color: Colors.white),), centerTitle: true, backgroundColor: Colors.blue, foregroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(controller: _controller1, hint: 'User Name'),
            SizedBox(height: 20,),
            CustomTextField(controller: _controller2, hint: 'Password'),
            SizedBox(height: 20,),
            CustomTextField(controller: _controller3, hint: 'Department'),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                FileMethods.saveInfo(_controller1.text, _controller2.text, _controller3.text);
                Navigator.pushReplacement(
                    context,
                  MaterialPageRoute(builder: (context) => HomePage(name: _controller1.text,))
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10)
              ),
              child: Text('Sign Up', style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Have an account? '),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn())
                    );
                  },
                  child: Text('Sign In', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, decoration: TextDecoration.underline, decorationColor: Colors.blue),),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
