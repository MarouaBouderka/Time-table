// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import '/database/tables.dart';
import '/widgets/TextFormField.dart';
import '../widgets/leftnavigator.dart'; // Assuming you have this widget defined
import '../widgets/Dialogs.dart'; // Assuming you have this widget defined

class Groups extends StatefulWidget {
  final String year;
  final String section;
  const Groups({
    super.key, 
    required this.year,
    required this.section
  });
  @override
  State<Groups> createState() => _GroupsState();
}
class _GroupsState extends State<Groups> {
  List<List<dynamic>> excelData = [];
  late Sheet sheet;
  @override
  void initState() {
    super.initState();
    _loadExcelData();
  }

  Future<void> _loadExcelData() async {
    Sheet? table = await GroupsSheet(widget.year, widget.section);
    List<List<dynamic>> data = [];
    for (var row in table!.rows.skip(1)) {
          if (row[1]!.value.toString() == widget.year && row[2]!.value.toString() == widget.section) {
            data.add(row);
          }
      }
    setState(() {
      excelData = data;
      sheet = table;
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
            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height * 0.25,MediaQuery.of(context).size.height * 0.1,0,0),
            child: Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Group ID', style: TextStyle(color: Colors.deepPurple))),
                    DataColumn(label: Text('Group Year', style: TextStyle(color: Colors.deepPurple))),
                    DataColumn(label: Text('Group Section', style: TextStyle(color: Colors.deepPurple))),
                    DataColumn(label: Text('Group Number', style: TextStyle(color: Colors.deepPurple))),
                    DataColumn(label: Text('Student Number', style: TextStyle(color: Colors.deepPurple))),
                  ],
                  rows: excelData.map((data) {
                    return DataRow(cells: <DataCell>[
                      DataCell(Text('${data[0].value}', style: const TextStyle(color: Colors.white))),
                      DataCell(Text('${data[1].value}', style: const TextStyle(color: Colors.white))),
                      DataCell(Text('${data[2].value}', style: const TextStyle(color: Colors.white))),
                      DataCell(Text('${data[3].value}', style: const TextStyle(color: Colors.white))),
                      DataCell(Text('${data[4].value}', style: const TextStyle(color: Colors.white))),
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
          groupsAddRowDialog(context);
        },
        backgroundColor: const Color.fromARGB(255, 130, 95, 191),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}


