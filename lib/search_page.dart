import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: Color(0xfffb8600),
            size: 100,
          ),
          SizedBox(height: 20,),
          Text('صفحة البحث', style: TextStyle(color: Color(0xfffb8600), fontSize: 40, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
