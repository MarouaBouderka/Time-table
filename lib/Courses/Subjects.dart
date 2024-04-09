import 'dart:typed_data';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/database/tables.dart';
import '/widgets/Dialogs.dart';
import '../widgets/leftnavigator.dart';

class Subjects extends StatefulWidget {
  final String field;
  const Subjects({
    Key? key,
    required this.field,
  });

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  List<List<dynamic>> excelData = [];

  @override
  void initState() {
    super.initState();
    _loadExcelData();
  }

  Future<void> _loadExcelData() async {
    List<List<dynamic>> data = await readSubjectsData(widget.field);
    setState(() {
      excelData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 180,
            color: Theme.of(context).colorScheme.secondary,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LeftNavigator(),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height * 0.2,MediaQuery.of(context).size.height * 0.1,0,0),
            child: Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Subject Code', style: TextStyle(color: Color.fromARGB(255, 33, 208, 243)))),
                    DataColumn(label: Text('Subject Title', style: TextStyle(color: Color.fromARGB(255, 33, 208, 243)))),
                    DataColumn(label: Text('Subject Category', style: TextStyle(color: Color.fromARGB(255, 33, 208, 243)))),
                    DataColumn(label: Text('Year', style: TextStyle(color: Color.fromARGB(255, 33, 208, 243)))),
                    DataColumn(label: Text('Semester', style: TextStyle(color: Color.fromARGB(255, 33, 208, 243)))),
                  ],
                  rows: excelData.map((data) {
                    return DataRow(cells: <DataCell>[
                      DataCell(Text('${data[0].value}', style: const TextStyle(color: Colors.white))),
                      DataCell(Text('${data[1].value}', style: const TextStyle(color: Colors.white))),
                      DataCell(Text('${data[3].value}', style: const TextStyle(color: Colors.white))),
                      DataCell(Text('${data[4].value}', style: const TextStyle(color: Colors.white))),
                      DataCell(Text('${data[5].value}', style: const TextStyle(color: Colors.white))),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          subjectsAddRowDialog(context, widget.field);
        },
        backgroundColor: Color.fromARGB(255, 92, 220, 255),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}


