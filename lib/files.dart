import 'dart:io';
import 'dart:ui';
import 'package:excel/excel.dart';

class Files {

  static Future<Map<String, List>> readExcelFile(File? filePath) async {
    var bytes = filePath!.readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    var currentTable = excel.tables[excel.tables.keys.first];
    Map<String, List> data = {};

    if (currentTable != null && currentTable.maxRows > 0) {
      List headers = currentTable.rows.first.toList();
      headers = [for (var cell in headers) cell?.value?.toString() ?? ""];
      data = { for (var header in headers) header : [] };

      for (int i = 1; i < currentTable.maxRows; i++) {
        var row = currentTable.rows[i];
        for(int j = 0; j < headers.length; j++) {
          var cellValue = (j < row.length) ? row[j]?.value.toString() : null;
          data[headers[j]]!.add(cellValue);
        }
      }
    }
    return data;
  }

}