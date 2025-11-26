import 'package:first_task/homePage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  void verify() {
    setState(() {
      _controller2.text = _controller1.text;
    });
  }
  void login() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(name: _controller1.text,)));
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
            Text('Second Assignment', style: TextStyle(color: Colors.deepOrange, fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 80,),
            CustomField(controller: _controller1, label: 'Enter Your Name', mode: false,),
            SizedBox(height: 20,),
            CustomField(controller: _controller2, label: 'Verify Your Name', mode: true,),
            SizedBox(height: 50,),
            CustomButton(title: 'Verify', action: verify),
            SizedBox(height: 20,),
            CustomButton(title: 'Login', action: login),
          ],
        ),
      ),
    );
  }
}

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool mode;
  const CustomField({
    super.key,
    required this.controller,
    required this.label,
    required this.mode
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: mode,
      decoration: InputDecoration(
        label: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(label, style: TextStyle(color: Colors.deepOrange.shade300, fontSize: 18, fontWeight: FontWeight.bold),),
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.deepOrange, width: 3)
        ),
      ),
    );
  }
}
class CustomButton extends StatelessWidget {
  final String title;
  final Function action;
  const CustomButton({
    super.key,
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          action();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),

        ),
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20),),
      ),
    );
  }
}
