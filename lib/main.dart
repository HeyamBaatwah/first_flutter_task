import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'المسبحة الإلكترونية',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'المسبحة الإلكترونية'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Adhkar {
  Adhkar(this.dhikr);
  String dhikr;
  int _counter = 0;
}

class _MyHomePageState extends State<MyHomePage> {
  List<Adhkar> adhkar = [Adhkar('ََسُبْحانَ الله'),Adhkar('الحَمْدُ لله'),Adhkar('اللهُ أكْبَر')];

  void _incrementCounter(Adhkar dhikr) {
    setState(() {
      dhikr._counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),),
      ),
      body: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCounter(adhkar[0]),
                SizedBox(height: 30,),
                buildCounter(adhkar[1]),
                SizedBox(height: 30,),
                buildCounter(adhkar[2])
              ]
            ),
          ),
          Positioned(
            bottom: 30,
            left: 30,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  for(Adhkar i in adhkar) {
                    i._counter = 0;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.all(20),
                  shape: CircleBorder()
              ),
              child: Text(
                '×',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildCounter(Adhkar dhikr) {
    return Column(
      children: [
        Text(
          dhikr.dhikr,
          style: TextStyle(
              fontSize: 40
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            '${dhikr._counter}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              _incrementCounter(dhikr);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                )
            ),
            child: Text(
              dhikr.dhikr,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            )
        ),
      ],
    );
  }
}
