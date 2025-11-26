import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _skills = [
    'Programming: C++,C#, Java, Python',
    'Web: HTML, CSS',
    'Mobile: Flutter',
    'Database: Basic SQL',
    'Problem Solving',
    'Logical Thinking',
    'Creativity',
    'Self-learning / Continuous Learning'
  ];
  final _education  = [
    'Bachelor of Computer Science\nSeiyun University, Yemen (2022 – Expected 2026)',
    'Diploma in English Language – Hadramout Institute of Languages'
  ];
  final _experience = [
    'Mobile App Development using Flutter (Online Training)\nTechnical Club – 2024',
    'Internship at Seiyun University IT Center – Website Design and Development using WordPress'
  ];
   void h() {

     for(String i in _skills) {
       _skills.indexOf(i);
     }
   }
  
  MyHomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            'CV',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          )
        ),
        backgroundColor: Color(0xFFBF7EE2),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Heyam Shawqi Baatwah', style: TextStyle(color: Color(0xFF554E56), fontWeight: FontWeight.bold, fontSize: 30),),
                      Text('Computer Sciences Student', style: TextStyle(color: Color(0xFF7A6C79), fontSize: 20),),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Color(0xFFBF7EE2),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF554E56), width: 5),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        foregroundImage: Image.asset('assets/avatar.jpeg').image,
                      ),
                    )
                  ),
                )
              ],
            ),
            Divider(),
            InfoRow(title: 'Email', content: 'heyamBaatwah@gmail.com',),
            Divider(),
            InfoRow(title: 'Phone', content: '730005011',),
            Divider(),
            Section(title: 'Skills', list: _skills),
            Section(title: 'Education', list: _education),
            Section(title: 'Experience', list: _experience),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String content;
  const InfoRow({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Color(0xFF554E56), fontSize: 20, fontWeight: FontWeight.bold),),
          Text(content, style: TextStyle(color: Color(0xFF554E56), fontSize: 16),)
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final list;
  const Section({
    super.key,
    required this.title,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(right: 20, top: 20),
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: Color(0xFFBF7FE0),
              borderRadius: BorderRadius.only(topRight: Radius.circular(50))
          ),
          child: Text(title, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
        ),
        for(String item in list)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text('${list.indexOf(item)+1} - $item', style: TextStyle(color: Color(0xFF554E56), fontSize: 18),),
          )
      ],
    );
  }
}