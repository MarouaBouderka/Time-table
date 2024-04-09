// ignore_for_file: non_constant_identifier_names, avoid_print
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import '/database/tables.dart';
import '/widgets/Dialogs.dart';
import '/widgets/TextFormField.dart';
import '../widgets/leftnavigator.dart'; // Assuming you have this widget defined

class Staff extends StatefulWidget {
  const Staff({
    super.key, 
  });
  @override
  State<Staff> createState() => _StaffState();
}

class _StaffState extends State<Staff> {
  List<List<dynamic>> teachers = [];
  Map<String, List<String>> teacherWorkingDays = {};

  @override
  void initState() {
    super.initState();
    _loadExcelData();
  }

  Future<void> _loadExcelData() async {
    List<List<dynamic>> t_data = await readTeachersData();
    Map<String, List<String>> wd_data = await readWorkingDaysData();
    setState(() {
      teachers = t_data;
      teacherWorkingDays = wd_data;
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
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.height * 0.1,
                MediaQuery.of(context).size.height * 0.1,
                0,
                0),
            child: Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  dataRowHeight: 100,
                  columns: const <DataColumn>[
                    DataColumn(
                        label: Text('Teacher Name',
                            style: TextStyle(color: Colors.yellow))),
                    DataColumn(
                        label: Text('Teacher Grade',
                            style: TextStyle(color: Colors.yellow))),
                    DataColumn(
                        label: Text('Field',
                            style: TextStyle(color: Colors.yellow))),
                    DataColumn(
                        label: Text('Working Days',
                            style: TextStyle(color: Colors.yellow))),
                  ],
                  rows: teachers.map((data) {
                    String teacherId = data[0].value.toString();
                    List<String> workingDays =
                        teacherWorkingDays[teacherId] ?? [];
                    return DataRow(cells: <DataCell>[
                      DataCell(
                          Text('${data[1].value}',
                              style: const TextStyle(color: Colors.white))),
                      DataCell(
                          Text('${data[2].value}',
                              style: const TextStyle(color: Colors.white))),
                      DataCell(
                          Text('${data[3].value}',
                              style: const TextStyle(color: Colors.white))),
                      DataCell(
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: workingDays
                              .map((day) => Text(day,
                                  style: const TextStyle(color: Colors.white)))
                              .toList(),
                        ),
                      ),
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
          teacherAddRowDialog(context);
        },
        backgroundColor: const Color.fromARGB(255, 255, 242, 126),
        child: const Icon(Icons.add,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
