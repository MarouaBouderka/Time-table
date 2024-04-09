import 'dart:typed_data';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/database/tables.dart';
import '/widgets/Dialogs.dart';
import '/widgets/TextFormField.dart';
import '/Naviator/navigator.dart';
import '/TimeTables/timetable.dart';
import '../widgets/leftnavigator.dart';

class Rooms extends StatefulWidget {
  final String type;
  const Rooms({
    Key? key,
    required this.type
    });

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  List<List<dynamic>> excelData = [];

  @override
  void initState() {
    super.initState();
    _loadExcelData();
  }

  Future<void> _loadExcelData() async {
    List<List<dynamic>> data = await readResourcesData(widget.type);
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
            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height * 0.5,MediaQuery.of(context).size.height * 0.1,0,0),
            child: Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Room ID', style: TextStyle(color: Colors.orange))),
                    DataColumn(label: Text('Room Type', style: TextStyle(color: Colors.orange))),
                    DataColumn(label: Text('Capacity', style: TextStyle(color: Colors.orange))),
                  ],
                  rows: excelData.map((data) {
                    return DataRow(cells: <DataCell>[
                      DataCell(Text('${data[0].value}', style: const TextStyle(color: Colors.white))),
                      DataCell(Text('${data[1].value}', style: const TextStyle(color: Colors.white))),
                      DataCell(Text('${data[3].value}', style: const TextStyle(color: Colors.white))),
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
          roomsAddRowDialog(context, widget.type);
        },
        backgroundColor: Color.fromARGB(255, 255, 193, 99),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}


