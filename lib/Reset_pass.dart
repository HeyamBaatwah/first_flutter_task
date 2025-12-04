import 'package:files_challenge/Home_page.dart';
import 'package:files_challenge/Sign_in.dart';
import 'package:files_challenge/files_methods.dart';
import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({super.key});

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  late String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reset Password', style: TextStyle(fontSize: 30, color: Colors.white),), centerTitle: true, backgroundColor: Colors.blue, foregroundColor: Colors.white,),
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
            CustomTextField(controller: _controller3, hint: 'New Password'),
            SizedBox(height: 5,),
            Text(message, style: TextStyle(color: Colors.red,),),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () async {
                List<String> info = await FileMethods.checkValue(_controller1.text, _controller2.text);
                if(info.isNotEmpty) {
                  FileMethods.saveInfo(info[0], _controller3.text, info[2]);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage(name: info[0]))
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
              child: Text('Reset', style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Back to '),
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
