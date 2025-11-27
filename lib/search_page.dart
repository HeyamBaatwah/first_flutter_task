import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final List dictionary;
  const SearchPage({super.key, required this.dictionary});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 80),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))
          ),
          child: Text('القاموس', style: TextStyle(color: Color(0xff0343cb), fontSize: 40, fontWeight: FontWeight.bold),),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.dictionary.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(widget.dictionary[index][0], style: TextStyle(color: Color(0xff0343cb), fontSize: 25, fontWeight: FontWeight.bold),),
                      subtitle: Text(widget.dictionary[index][1], style: TextStyle(color: Color(0xff75b5f6), fontSize: 20, fontWeight: FontWeight.bold),),
                      leading: Icon(Icons.translate, color: Color(0xff0343cb), size: 30,),
                      trailing: Icon(widget.dictionary[index][2] ?  Icons.check_circle : Icons.check_circle_outline , color: Color(0xff75b5f6), size: 30,),
                      onTap: () {
                        setState(() {
                          widget.dictionary[index][2] = !widget.dictionary[index][2];
                        });
                      },
                    ),
                    Divider(color: Color(0xffd8e8f6),)
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

