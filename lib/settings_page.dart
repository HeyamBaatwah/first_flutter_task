import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              padding: EdgeInsets.only(top: 80),
              child: Text('الاعدادات', style:  TextStyle(color: Color(0xff0343cb), fontSize: 40, fontWeight: FontWeight.bold),),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 80, bottom: 50, right: 20, left: 20),
                child: Divider(color: Color(0xffd8e8f6),),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              padding: EdgeInsets.only(bottom: 60),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 50, right: 20, left: 20),
                    child: Divider(color: Color(0xffd8e8f6),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50, right: 20, left: 20),
                    child: Divider(color: Color(0xffd8e8f6),),
                  ),
                ],
              )
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 60, right: 20, left: 20),
                child: Divider(color: Color(0xffd8e8f6),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
