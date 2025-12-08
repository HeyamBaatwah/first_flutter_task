import 'package:first_task/custom_button.dart';
import 'package:first_task/custom_field.dart';
import 'package:first_task/home_page.dart';
import 'package:first_task/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  Future<void> sign_up() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _controller1.text);
    await prefs.setString('email', _controller2.text);
    await prefs.setString('password', _controller3.text);
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(username: _controller1.text,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Sign up', style: TextStyle(color: Colors.deepOrange, fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 80,),
            CustomField(controller: _controller1, label: 'Enter Your Name', mode: false,),
            SizedBox(height: 20,),
            CustomField(controller: _controller2, label: 'Enter Your Email', mode: false,),
            SizedBox(height: 20,),
            CustomField(controller: _controller3, label: 'Enter Your Password', mode: true,),
            SizedBox(height: 50,),
            CustomButton(title: 'save', action: sign_up),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an acount?', style: TextStyle(color: Colors.deepOrange, fontSize: 15,),),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text('Log in', style: TextStyle(color: Colors.deepOrange, fontSize: 15),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}



