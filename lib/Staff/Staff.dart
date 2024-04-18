// ignore_for_file: non_constant_identifier_names, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_db_local/database/helper_fct.dart';
import '/widgets/Dialogs.dart';
import '../widgets/leftnavigator.dart'; // Assuming you have this widget defined

class Staff extends StatefulWidget {
  const Staff({
    super.key, 
  });
  @override
  State<Staff> createState() => _StaffState();
}

class _StaffState extends State<Staff> {
  List<Map<String, dynamic>> teacherData = [];
  Map<String, List<String>> teacherWorkingDays = {};

  @override
  void initState() {
    super.initState();
    _fetchTeachers();
  }

  Future<void> _fetchTeachers() async {
    try {
      teacherData = await TeachersData.getTeacher();
      setState(() {});
    } catch (e) {
      print('Error fetching subjects: $e');
    }
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
                MediaQuery.of(context).size.height * 0.05,
                MediaQuery.of(context).size.height * 0.1,
                0,
                0),
            child: Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  dataRowHeight: 100,
                  columns: const <DataColumn>[
                    DataColumn(
                        label: Text('Teacher Id',
                            style: TextStyle(color: Colors.yellow))),
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
                    DataColumn(
                        label: Text('',
                            style: TextStyle(color: Colors.yellow))),        
                  ],
                  
                  rows: teacherData.map(
                    (teacher) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(teacher['teacher_id'], style: const TextStyle(color: Colors.white))),
                        DataCell(Text(teacher['teacher_name'], style: const TextStyle(color: Colors.white))),
                        DataCell(Text(teacher['teacher_grade'], style: const TextStyle(color: Colors.white))),
                        DataCell(Text(teacher['field'], style: const TextStyle(color: Colors.white))),
                        DataCell(
                          FutureBuilder<List<Map<String, dynamic>>>(
                            future: WorkingDaysData.getAllWorkingDays(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator(); // Placeholder while loading
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                // Filter working days for the current teacher
                                List<String> workingDays = snapshot.data!
                                    .where((day) => day['teacher_id'] == teacher['teacher_id'])
                                    .map((day) => day['week_day'].toString())
                                    .toList();
                                return Text(workingDays.join('\n '), style: const TextStyle(color: Colors.white));
                              }
                            },
                          ),
                        ),
                        DataCell(
                          IconButton(
                            color: Colors.white,
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              TeachersData.deleteTeacher(teacher['teacher_id']);
                              _fetchTeachers();
                            },
                          ),
                        )
                      ],
                    ),
                  ).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await teacherAddRowDialog(context);
          _fetchTeachers();
        },
        backgroundColor: const Color.fromARGB(255, 255, 242, 126),
        child: const Icon(Icons.add,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
