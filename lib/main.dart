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
  List<Adhkar> adhkar = [Adhkar('سُبْحانَ الله'), Adhkar('الحَمْدُ لله'), Adhkar('اللهُ أكْبَر')];
  int current = 0;
  int num = 1;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff306732),
        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // progress bar
          Container(
            height: 60,
            color: Color(0xFFD8D8D8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '33/${adhkar[current]._counter}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 10,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        width: (300/33)*adhkar[current]._counter.toDouble(),
                        decoration: BoxDecoration(
                          color: Color(0xff306732),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //text
          Column(
            children: [

              Text(
                adhkar[current].dhikr,
                style: TextStyle(
                    fontSize: 60
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(
                      color: current > 1 ? Color(0xff306732) : Colors.grey,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(
                      color: current > 0 ? Color(0xff306732) : Colors.grey,
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(
                      color: current >= 0 ? Color(0xff306732) : Colors.grey,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
                    ),
                  ),
                ],
              ),
            ],
          ),
          //read button
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: ElevatedButton(
                onPressed: () {
                      setState(() {
                        if(adhkar[current]._counter < 33)
                          adhkar[current]._counter++;
                        else
                          {
                            adhkar[current]._counter = 0;
                            current= num % 3;
                            num++;
                          }
                      });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff306732),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 170, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
                child: Text(
                  'قراءة',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }


}
