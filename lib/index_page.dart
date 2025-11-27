import 'package:first_task/account_page.dart';
import 'package:first_task/home_page.dart';
import 'package:first_task/search_page.dart';
import 'package:first_task/settings_page.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _navIndex = 0;
  List<Widget> _pages = [
    HomePage(),
    SearchPage(dictionary: HomePage.dictionary,),
    AccountPage(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f7fc),
      body: IndexedStack(
        index: _navIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navIndex,
        onTap: (index){
          setState(() {
            _navIndex = index;
            _pages[1] = SearchPage(dictionary: HomePage.dictionary);
          });
        },
        unselectedItemColor: Color(0xffd8e8f6),
        selectedItemColor: Color(0xff0343cb),
        items: [
          BottomNavigationBarItem(label: 'الرئيسية', icon: Icon(Icons.home_filled), backgroundColor: Color(0xfff4f7fc)),
          BottomNavigationBarItem(label: 'البحث', icon: Icon(Icons.search), backgroundColor: Colors.white),
          BottomNavigationBarItem(label: 'الحساب', icon: Icon(Icons.account_box), backgroundColor: Colors.white),
          BottomNavigationBarItem(label: 'الاعدادات', icon: Icon(Icons.settings), backgroundColor: Colors.white),
        ],
      ),
    );
  }
}
