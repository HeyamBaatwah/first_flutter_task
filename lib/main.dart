import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
List<String> _todos= [];

void _addTask(String task) {
  if(task.isNotEmpty) {
    setState(() {
      _todos.add(task);
    });
  }
}

void _deleteTask(int index) {
  setState(() {
    _todos.removeAt(index);
  });
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFF8F1ED),
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F1ED),
        title: Center(
          child: Text(
            "To Do List",
            style: TextStyle(
              color: Colors.deepPurple.shade100,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,),
            child: Container(
              color: Color(0xFFF8F1ED),
              child: TextField(
                onSubmitted: _addTask,
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF818181)
                ),
                decoration: InputDecoration(
                  label: Text('Enter a new task'),
                  labelStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink.shade100,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListTile(
                    tileColor: index%2 == 1? Colors.pink.shade100: Colors.deepPurple.shade100,
                    title: Text(
                      _todos[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () => _deleteTask(index),
                      icon: Icon(
                        Icons.delete,
                        color: Colors.grey,
                      )
                    ),
                  ),
                );
              }
            )
          )
        ],
      ),
    );
  }
}
