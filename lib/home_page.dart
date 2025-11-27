import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static List dictionary = [];
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _inputController = TextEditingController();
  TextEditingController _engController = TextEditingController();
  TextEditingController _arpController = TextEditingController();

  void enterToEng() {
    setState(() {
      _engController.text = _inputController.text;
    });
  }

  void enterToArp() {
    setState(() {
      _arpController.text = _inputController.text;
    });
  }

  void addToDict() {
    setState(() {
      HomePage.dictionary.add([_engController.text, _arpController.text, false]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 20),
              child: Icon(Icons.translate, color: Color(0xff0343cb), size: 150,),
            ),
            Text('أضف كلمة جديدة للقاموس', style: TextStyle(color: Color(0xff0343cb), fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(
              height: 30,
            ),
            WordsField(controller: _inputController, hint: 'ادخل الكلمة', readOnly: false,),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(child: WordsField(controller: _arpController, hint: 'الكلمة العربية', readOnly: true,)),
                SizedBox(width: 20,),
                Expanded(child: WordsField(controller: _engController, hint: 'الكلمةالانجليزية', readOnly: true,)),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(child: WordsButton(action: enterToArp, hint: 'ادخال للعربية')),
                SizedBox(width: 20,),
                Expanded(child: WordsButton(action: enterToEng, hint: 'ادخال للإنجليزية')),
              ],
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: WordsButton(action: addToDict, hint: 'إضافة للقاموس')
            ),
          ]
      )
    );
  }
}

class WordsField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool readOnly;
  const WordsField({
    super.key,
    required this.controller,
    required this.hint,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textDirection: TextDirection.rtl,
      readOnly: readOnly,
      decoration: InputDecoration(
        hintText: hint,
        hintTextDirection: TextDirection.rtl,
        hintStyle: TextStyle(color: Color(0xff0343cb), fontSize: 15, fontWeight: FontWeight.bold),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xff0343cb), width: 2)
        )
      ),
    );
  }
}

class WordsButton extends StatelessWidget {
  final Function action;
  final String hint;
  const WordsButton({
    super.key,
    required this.action,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => action(),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff0343cb),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        padding: EdgeInsets.symmetric(vertical: 10)
      ),
      child: Text(hint, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
    );
  }
}

