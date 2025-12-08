import 'package:first_task/custom_button.dart';
import 'package:first_task/custom_field.dart';
import 'package:first_task/home_page.dart';
import 'package:first_task/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();
    String name = await prefs.getString('username')!;
    String pass = await prefs.getString('password')!;
    if(name == _controller1.text && pass == _controller2.text) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(username: name,)));
    }
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
            Text('Log In', style: TextStyle(color: Colors.deepOrange, fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 80,),
            CustomField(controller: _controller1, label: 'Enter Your Name', mode: false,),
            SizedBox(height: 20,),
            CustomField(controller: _controller2, label: 'Enter Your Password', mode: true,),
            SizedBox(height: 50,),
            CustomButton(title: 'Log In', action: login),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an acount?', style: TextStyle(color: Colors.deepOrange, fontSize: 15,),),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text('Sign up', style: TextStyle(color: Colors.deepOrange, fontSize: 15),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}



