import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  final pro_details;
  const ViewPage({super.key, required this.pro_details,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products Details', style: TextStyle(color: Colors.deepPurple, fontSize: 30, fontWeight: FontWeight.bold),), backgroundColor: Colors.white, centerTitle: true ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: ListView.builder(
          itemCount: pro_details.values.first.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: Color(0x22673AB7),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color(0xFF673AB7),
                    width: 3,
                  )
              ),
              child: ListTile(
                title: Text(pro_details['name'][index].toString(), style: TextStyle(color: Colors.deepPurple, fontSize: 20, fontWeight: FontWeight.bold),),
                subtitle: Text(pro_details['price'][index].toString(), style: TextStyle(color: Colors.black54, fontSize: 18),),
              ),
            );
          },
        )
      )
    );
  }
}

