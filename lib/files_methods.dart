import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileMethods {

  static saveInfo(String username, String password, String department) async {
    final appSupport = await getApplicationSupportDirectory();
    final File file = File('${appSupport.path}/sign_file.txt');
    file.writeAsString('UserName_$username, Password_$password, Department_$department');
  }

  static Future<List<String>> checkValue(String username, String password) async {
    final appSupport = await getApplicationSupportDirectory();
    final File file = File('${appSupport.path}/sign_file.txt');
    String content = await file.readAsString();
    List<String> field = content.split(',');
    List<String> info = [];
    for (int i = 0; i < field.length; i++) {
      info.add(field[i].split('_')[1]);
    }
    if(info[0] == username && info[1] == password) {
      print('our info');
      return info;
    } else {
      print('errror');
      return [];
    }
  }

  static Future<List<String>> read () async {
    final appSupport = await getApplicationSupportDirectory();
    final File file = File('${appSupport.path}/sign_file.txt');
    String content = await file.readAsString();
    List<String> field = content.split(',');
    List<String> info = [];
    for (int i = 0; i < field.length; i++) {
      info.add(field[i].split('_')[1]);
    }
    return info;
  }

}