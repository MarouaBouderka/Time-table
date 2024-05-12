// ignore_for_file: avoid_print, unnecessary_null_comparison
import 'dart:io';
import 'package:excel/excel.dart';

Future<List> readExcelFile(String path, String sheet) async {
  print('PAAATH');
  print(path);
  print('Sheeet');
  print(sheet);
  try {
    String excelFilePath = path; 
    String sheetName = sheet; 
    var bytes = File(excelFilePath).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    var table = excel.tables[sheetName];
    return table!.rows;
  } catch (e, stackTrace) {
    print("Error reading Excel data: $e");
    print(stackTrace);
    return [];
  }
}

