import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:excel/excel.dart';
import 'dart:typed_data';
import 'dart:io';

Future<void> addRowToExcel(String id, String year, String section, String groupNumber, String studentNumber) async {
  try {
    ByteData data = await rootBundle.load('/groups.xlsx'); 
    var bytes = data.buffer.asUint8List();
    var excel = Excel.decodeBytes(bytes);

    TextCellValue Id = TextCellValue(id);
    TextCellValue Year = TextCellValue(year);
    TextCellValue Section = TextCellValue(section);
    TextCellValue Group = TextCellValue(groupNumber);
    TextCellValue StudentNb = TextCellValue(studentNumber);
    print([Id, Year, Section, Group, StudentNb]);

    excel.appendRow('Feuil1', [Id, Year, Section, Group, StudentNb]);

    // Save the modifications back to the file
    var file = File('/.xlsx');
    var encodedExcel = excel.encode();
    if (encodedExcel != null) {
      await file.writeAsBytes(encodedExcel);
      print("Row added successfully.");
    } else {
      print("Error: Failed to encode Excel data.");
    }
  } catch (e) {
    print("Error: $e");
  }
}