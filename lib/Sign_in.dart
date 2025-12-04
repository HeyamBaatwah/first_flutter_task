import 'package:files_challenge/Reset_pass.dart';
import 'package:files_challenge/Sign_up.dart';
import 'package:files_challenge/files_methods.dart';
import 'package:flutter/material.dart';
import 'Home_page.dart';
import 'custom_text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  late String message = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In', style: TextStyle(fontSize: 30, color: Colors.white),), centerTitle: true, backgroundColor: Colors.blue, foregroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(controller: _controller1, hint: 'User Name'),
            SizedBox(height: 20,),
            CustomTextField(controller: _controller2, hint: 'Password'),
            SizedBox(height: 5,),
            Text(message, style: TextStyle(color: Colors.red,),),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () async {
               List<String> result = await FileMethods.checkValue(_controller1.text, _controller2.text);
               if(result.isNotEmpty) {
                 Navigator.pushReplacement(
                   context,
                   MaterialPageRoute(builder: (context) => HomePage(name: _controller1.text))
                 );
               } else {
                 setState(() {
                   message = 'Invalid username or password';
                 });
               }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10)
              ),
              child: Text('Sign In', style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account? '),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp())
                    );
                  },
                  child: Text('Sign Up', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, decoration: TextDecoration.underline, decorationColor: Colors.blue),),
                )
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ResetPass())
                );
              },
              child: Text('Reset Your Password', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, decoration: TextDecoration.underline, decorationColor: Colors.blue),),
            ),
          ],
        ),
      ),
    );
  }
}



