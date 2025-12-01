import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  bool isAgreed = false;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'استمارة فتح حساب بنكي',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar: AppBar(title: Text('استمارة فتح حساب بنكي', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),), backgroundColor: Color(0xfff5f5f5), centerTitle: true,),
        body: Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.symmetric(horizontal: 20,),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Header(title: 'المعلومات الشخصية'),
                  TextFielSection(label: 'الاسم', hint: 'ادخل اسمك الكامل', validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'الرجاء ادخال الاسم';
                    }
                    return null;
                  }),
                  DateOfBirth(),
                  TextFielSection(label: 'رقم الهوية', hint: 'ادخل رقم الهوية او جواز السفر', validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "الرجاء إدخال رقم الهوية";
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return "رقم الهوية يجب أن يحتوي على أرقام فقط";
                    }
                    if (value.length != 10) {
                      return "رقم الهوية يجب أن يكون 10 أرقام";
                    }
                    return null;
                  }),
                  Gender(),
                  Header(title: 'بيانات الإتصال'),
                  TextFielSection(label: 'رقم الهاتف', hint: 'ادخل رقم الهاتف المحمول', validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "الرجاء إدخال رقم الهاتف";
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return "رقم الهاتف يجب أن يحتوي على أرقام فقط";
                    }
                    if (value.length != 9) {
                      return "رقم الهاتف يجب أن يكون 9 أرقام";
                    }
                    if (!value.startsWith("7")) {
                      return "رقم الهاتف يجب أن يبدأ بـ 7";
                    }
                    return null;
                  },),
                  TextFielSection(label: 'لبريد الإلكتروني', hint: 'ادخل بريدك الإلكتروني', validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "الرجاء إدخال البريد الإلكتروني";
                    }
                    if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(value)) {
                      return "صيغة البريد الإلكتروني غير صحيحة";
                    }
                    return null;
                  },),
                  TextFielSection(label: 'العنوان', hint: 'ادخل عنوانك بالتفصيل', validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "الرجاء إدخال العنوان";
                    }
                    if (value.length < 5) {
                      return "العنوان قصير جدًا";
                    }
                    return null;
                  },),
                  Header(title: 'تفاصيل الحساب المطلوب'),
                  AccountType(),
                  Currency(),
                  TextFielSection(label: 'المهنة', hint: 'ادخل مهنتك', validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "الرجاء إدخال المهنة";
                    }
                    if (value.length < 3) {
                      return "المهنة يجب أن تكون 3 أحرف أو أكثر";
                    }
                    if (!RegExp(r'^[\u0621-\u064A\sA-Za-z]+$').hasMatch(value)) {
                      return "المهنة يجب أن تحتوي على أحرف فقط";
                    }
                    return null;
                  },),
                  TextFielSection(label: 'الدخل الشهري', hint: 'ادخل دخلك الشهري', validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال الدخل الشهري';
                    }
                    if (double.tryParse(value) == null) {
                      return 'الرجاء إدخال رقم صحيح';
                    }
                    return null;
                  },),
                  Submit(formKey: _formKey,),
                  SizedBox(height: 50,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String title;
  const Header({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 30,),
        Text(title, style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold), textDirection: TextDirection.rtl, textAlign: TextAlign.right,),
        Divider(color: Color(0xffdadada), height: 20, thickness: 2,),
      ],
    );
  }
}


class TextFielSection extends StatefulWidget {
  final String label;
  final String hint;
  final String? Function(String?) validator;
  const TextFielSection({super.key, required this.label, required this.hint, required this.validator});

  @override
  State<TextFielSection> createState() => _TextFielSectionState();
}

class _TextFielSectionState extends State<TextFielSection> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 20,),
        Text(widget.label, style: TextStyle(color: Colors.black87, fontSize: 20,),),
        TextFormField(
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
              hintText: widget.hint,
              hintTextDirection: TextDirection.rtl,
              hintStyle: TextStyle(color: Color(0xffaaaaaa), fontSize: 18,),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xffdadada), width: 1)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xffaaaaaa), width: 2.5)
              )
          ),
          validator: widget.validator
        )
      ],
    );
  }
}


class DateOfBirth extends StatefulWidget {
  const DateOfBirth({super.key,});

  @override
  State<DateOfBirth> createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  int? selectedDay;
  String? selectedMonth;
  int? selectedYear;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 20,),
        Text('تاريخ الميلاد', style: TextStyle(color: Colors.black87, fontSize: 20,),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 120,
              child: DropdownButtonFormField<int>(
                decoration: InputDecoration(
                    hintText: 'السنة',
                    hintTextDirection: TextDirection.rtl,
                    hintStyle: TextStyle(color: Color(0xffaaaaaa), fontSize: 18,),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xffdadada), width: 1)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xffaaaaaa), width: 2.5)
                    )
                ),
                items: List.generate(2025 - 1800 + 1, (index) => 1800 + index)
                    .map((year) => DropdownMenuItem(
                  value: year,
                  child: Text("$year"),
                )).toList(),
                onChanged: (value) {
                  selectedYear = value;
                },
                validator: (value) =>
                value == null ? "الرجاء اختيار السنة" : null,

              ),
            ),
            SizedBox(
              width: 120,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    hintText: 'الشهر',
                    hintTextDirection: TextDirection.rtl,
                    hintStyle: TextStyle(color: Color(0xffaaaaaa), fontSize: 18,),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xffdadada), width: 1)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xffaaaaaa), width: 2.5)
                    )
                ),
                items: [
                  "يناير",
                  "فبراير",
                  "مارس",
                  "أبريل",
                  "مايو",
                  "يونيو",
                  "يوليو",
                  "أغسطس",
                  "سبتمبر",
                  "أكتوبر",
                  "نوفمبر",
                  "ديسمبر",
                ]
                    .map((month) => DropdownMenuItem(
                  value: month,
                  child: Text("$month"),
                )).toList(),
                onChanged: (value) {
                  selectedMonth = value;
                },
                validator: (value) =>
                value == null ? "الرجاء اختيار الشهر" : null,

              ),
            ),
            SizedBox(
              width: 120,
              child: DropdownButtonFormField<int>(
                decoration: InputDecoration(
                    hintText: 'اليوم',
                    hintTextDirection: TextDirection.rtl,
                    hintStyle: TextStyle(color: Color(0xffaaaaaa), fontSize: 18,),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xffdadada), width: 1)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xffaaaaaa), width: 2.5)
                    )
                ),
                items: List.generate(31, (index) => index + 1)
                    .map((day) => DropdownMenuItem(
                  value: day,
                  child: Text("$day"),
                )).toList(),
                onChanged: (value) {
                  selectedDay = value;
                },
                validator: (value) =>
                value == null ? "الرجاء اختيار اليوم" : null,

              ),
            ),
          ],
        )
      ],
    );
  }
}


class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  int? gender;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 20,),
        Text('الجنس', style: TextStyle(color: Colors.black87, fontSize: 20,),),
        RadioListTile<int>(
          title: Text("ذكر", textDirection: TextDirection.rtl, textAlign: TextAlign.right,),
          value: 1,
          activeColor: Colors.black87,
          controlAffinity: ListTileControlAffinity.trailing,
          groupValue: gender,
          onChanged: (int? value) {
            setState(() {
              gender = value;
            });
          },
        ),
        RadioListTile<int>(
          title: Text("أنثى", textDirection: TextDirection.rtl, textAlign: TextAlign.right,),
          value: 2,
          activeColor: Colors.black87,
          controlAffinity: ListTileControlAffinity.trailing,
          groupValue: gender,
          onChanged: (int? value) {
            setState(() {
              gender = value;
            });
          },
        ),
      ],
    );
  }
}


class AccountType extends StatefulWidget {
  const AccountType({super.key});

  @override
  State<AccountType> createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  String? selectedType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
      SizedBox(height: 20,),
      Text('نوع الحساب', style: TextStyle(color: Colors.black87, fontSize: 20,),),
      DropdownButtonFormField<String>(
        decoration: InputDecoration(
            hintText: 'نوع الحساب',
            hintTextDirection: TextDirection.rtl,
            hintStyle: TextStyle(color: Color(0xffaaaaaa), fontSize: 18,),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xffdadada), width: 1)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xffaaaaaa), width: 2.5)
            )
        ),
        items: [
          "تجاري",
          "توفير",
          "استثماري"
        ]
            .map((type) => DropdownMenuItem(
          value: type,
          child: Text("$type"),
        )).toList(),
        onChanged: (value) {
          selectedType = value;
        },
        validator: (value) =>
        value == null ? "الرجاء اختيار النوع" : null,

      ),
    ],
    );
  }
}


class Currency extends StatefulWidget {
  const Currency({super.key});

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  String? selectedCurrency;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 20,),
        Text('العملة', style: TextStyle(color: Colors.black87, fontSize: 20,),),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
              hintText: 'العملة المستخدمة',
              hintTextDirection: TextDirection.rtl,
              hintStyle: TextStyle(color: Color(0xffaaaaaa), fontSize: 18,),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xffdadada), width: 1)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xffaaaaaa), width: 2.5)
              )
          ),
          items: [
            "ريال سعودي",
            "ريال يمني",
            "دولار امريكي",
            "يورو"
          ]
              .map((currency) => DropdownMenuItem(
            value: currency,
            child: Text("$currency"),
          )).toList(),
          onChanged: (value) {
            selectedCurrency = value;
          },
          validator: (value) =>
          value == null ? "الرجاء النوع العملة" : null,

        ),
      ],
    );
  }
}


class Submit extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const Submit({super.key, required this.formKey,});

  @override
  State<Submit> createState() => _SubmitState();
}

class _SubmitState extends State<Submit> {
  bool isAgreed = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 20,),
        CheckboxListTile(
          title: Text('أوافق على جميع الشروط والأحكام', style: TextStyle(color: Colors.black87, fontSize: 20,),textDirection: TextDirection.rtl, textAlign: TextAlign.right,),
          activeColor: Colors.black87,
          controlAffinity: ListTileControlAffinity.trailing,
          value: isAgreed,
          onChanged: (bool? value) {
            setState(() {
              isAgreed = value!;
            });
          },
        ),
        Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  if (widget.formKey.currentState!.validate()) {
                    widget.formKey.currentState!.save();
                    if (isAgreed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('تم إرسال الاستمارة بنجاح')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('يجب الموافقة على الشروط قبل الإرسال')),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('تأكد من إدخال جميع الحقول بشكل صحيح')),
                    );
                  }

                },
                child: Text('إرسال'),
              );
            }
        ),

      ],
    );
  }
}





