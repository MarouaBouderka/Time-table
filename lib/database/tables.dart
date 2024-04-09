// ignore_for_file: avoid_print
import 'package:flutter/services.dart';
import 'package:excel/excel.dart';



/* Subjects */

Future<List<List<dynamic>>> readSubjectsData(String fieldName) async {
  try {
    ByteData data = await rootBundle.load('assets/subjects.xlsx'); // Change the path to your Excel file
    var bytes = data.buffer.asUint8List();
    var excel = Excel.decodeBytes(bytes);
    var table = excel.tables['Feuil1']; // Assuming your data is in a sheet named 'Feuil1'
    List<List<dynamic>> excelData = [];

    if (table != null) {
      // Skip the first row as it contains headers
      for (var row in table.rows.skip(1)) {
        if (row != null) {
          if (row.length > 2 && row[2]!.value.toString() == fieldName) {
            excelData.add(row);
          }
        } else {
          print("Warning: Encountered a null row while reading Excel data.");
        }
      }
    } else {
      print("Error: Unable to find 'Feuil1' in the Excel file.");
    }
    return excelData;
  } catch (e, stackTrace) {
    print("Error reading Excel data: $e");
    print(stackTrace);
    return [];
  }
}



/* Resources */

Future<List<List<dynamic>>> readResourcesData(String type) async {
  try {
    ByteData data = await rootBundle.load('assets/rooms.xlsx'); // Change the path to your Excel file
    var bytes = data.buffer.asUint8List();
    var excel = Excel.decodeBytes(bytes);
    var table = excel.tables['Feuil1']; // Assuming your data is in a sheet named 'Feuil1'
    List<List<dynamic>> excelData = [];

    if (table != null) {
      // Skip the first row as it contains headers
      for (var row in table.rows.skip(1)) {
        if (row != null) {
          if (row.length > 2 && row[1]!.value.toString() == type) {
            excelData.add(row);
          }
        } else {
          print("Warning: Encountered a null row while reading Excel data.");
        }
      }
    } else {
      print("Error: Unable to find 'Feuil1' in the Excel file.");
    }
    return excelData;
  } catch (e, stackTrace) {
    print("Error reading Excel data: $e");
    print(stackTrace);
    return [];
  }
}



/* Teachers */

Future<List<List<dynamic>>> readTeachersData() async {
  try {
    ByteData data = await rootBundle.load('assets/teachers.xlsx'); 
    print('********* \n\n ${data} \n\n ********');
    var bytes = data.buffer.asUint8List();
    var excel = Excel.decodeBytes(bytes);
    var table = excel.tables['Feuil1']; // Assuming your data is in a sheet named 'Feuil1'
    List<List<dynamic>> excelData = [];

    if (table != null) {
      // Skip the first row as it contains headers
      for (var row in table.rows.skip(1)) {
        if (row != null) {
            excelData.add(row);
        } else {
          print("Warning: Encountered a null row while reading Excel data.");
        }
      }
    } else {
      print("Error: Unable to find 'Feuil1' in the Excel file.");
    }
    return excelData;
  } catch (e, stackTrace) {
    print("Error reading Excel data: $e");
    print(stackTrace);
    return [];
  }
}



/* Working Days */

Future<Map<String, List<String>>> readWorkingDaysData() async {
  try {
    ByteData data = await rootBundle.load('assets/working_days.xlsx'); // Change the path to your Excel file
    var bytes = data.buffer.asUint8List();
    var excel = Excel.decodeBytes(bytes);
    var table = excel.tables['Feuil1']; // Assuming your data is in a sheet named 'Feuil1'
    Map<String, List<String>> excelData = {};

    if (table != null) {
      for (var row in table.rows.skip(1)) {
        if (row != null) {
          String teacherId = row[0]!.value.toString();
          String workingDay = row[1]!.value.toString();
          excelData.putIfAbsent(teacherId, () => []);
          excelData[teacherId]!.add(workingDay);
        } else {
          print("Warning: Encountered a null row while reading Excel data.");
        }
      }
    } else {
      print("Error: Unable to find 'Feuil1' in the Excel file.");
    }
    return excelData;
  } catch (e, stackTrace) {
    print("Error reading Excel data: $e");
    print(stackTrace);
    return {};
  }
}




/* Groups */

Future<Sheet?> GroupsSheet(String year, String section) async {
  try {
    ByteData data = await rootBundle.load('assets/groups.xlsx'); // Change the path to your Excel file
    var bytes = data.buffer.asUint8List();
    var excel = Excel.decodeBytes(bytes);
    var table = excel.tables['Feuil1']; // Assuming your data is in a sheet named 'Feuil1'
    return table;
  } catch (e, stackTrace) {
    print("Error reading Excel data: $e");
    print(stackTrace);
  }
}



/* calculate nb of sections for a year */

Future<int> nbOfSections(String year) async {
  try {
    ByteData data = await rootBundle.load('assets/groups.xlsx'); // Change the path to your Excel file
    var bytes = data.buffer.asUint8List();
    var excel = Excel.decodeBytes(bytes);
    var table = excel.tables['Feuil1']; // Assuming your data is in a sheet named 'Feuil1'
    Set<String> distinctValues = {}; // Set to store distinct values of row[2]
    if (table != null) {
      // Skip the first row as it contains headers
      for (var row in table.rows.skip(1)) {
        if (row != null) {
          if (row.length > 2 && row[1]!.value.toString() == year) {
            distinctValues.add(row[2]!.value.toString()); // Add value to set
          }
        } else {
          print("Warning: Encountered a null row while reading Excel data.");
        }
      }
    } else {
      print("Error: Unable to find 'Feuil1' in the Excel file.");
    }
    return distinctValues.length; // Return the count of distinct values
  } catch (e, stackTrace) {
    print("Error reading Excel data: $e");
    print(stackTrace);
    return 0;
  }
}














/*
Future<List<Map<String, dynamic>>> extSubjectsData(String path, String sheet) async {
  try {
    ByteData data = await rootBundle.load(path); // Change the path to your Excel file
    var bytes = data.buffer.asUint8List();
    var excel = Excel.decodeBytes(bytes);
    var table = excel.tables[sheet]; // Assuming your data is in a sheet named 'Feuil1'
    List<Map<String, dynamic>> excelData = [];

    if (table != null) {
      List<String> headers = table.rows.first.map((cell) => cell.toString()).toList();
      
      // Skip the first row as it contains headers
      for (var row in table.rows.skip(1)) {
        Map<String, dynamic> rowData = {};
        for (int i = 0; i < headers.length; i++) {
          rowData[headers[i]] = row[i];
        }
        excelData.add(rowData);
      }
    }
    return excelData;
  } catch (e, stackTrace) {
    print("Error reading Excel data: $e");
    print(stackTrace);
    return [];
  }
}
*/