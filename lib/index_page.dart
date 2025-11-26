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
    AccountPage(),
    SearchPage(),
    SettingsPage()
  ];

  String _getTitle(int index) {
    switch (index){
      case 0 : return 'الصفحة الرئيسية';
      case 1 : return 'صفحة الحساب';
      case 2 : return 'صفحة البحث';
      case 3 : return 'صفحة الاعدادات';
      default : return 'Error 404';

    }
  }

  Color _getColor(int index) {
    switch (index){
      case 0 : return Color(0xff023048);
      case 1 : return Color(0xff229ebd);
      case 2 : return Color(0xfffb8600);
      case 3 : return Color(0xffffb702);
      default : return Colors.grey;

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Center(child: Text(_getTitle(_navIndex), style: TextStyle(color: Colors.white, fontSize: 30),)), backgroundColor: _getColor(_navIndex),),
      body: IndexedStack(
        index: _navIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navIndex,
        onTap: (index){
          setState(() {
            _navIndex = index;
          });
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: _getColor(_navIndex),
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(label: 'الرئيسية', icon: Icon(Icons.home_filled),),
          BottomNavigationBarItem(label: 'الحساب', icon: Icon(Icons.account_box)),
          BottomNavigationBarItem(label: 'البحث', icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: 'الاعدادات', icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}
