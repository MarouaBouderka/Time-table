// ignore_for_file: non_constant_identifier_names, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_db_local/database/helper_fct.dart';
import '/widgets/Dialogs.dart';
import '../widgets/leftnavigator.dart'; // Assuming you have this widget defined

class GroupsTeachers extends StatefulWidget {
  const GroupsTeachers({
    super.key, 
  });
  @override
  State<GroupsTeachers> createState() => _groupsTeachersState();
}

class _groupsTeachersState extends State<GroupsTeachers> {
  List<Map<String, dynamic>> teacherData = [];
  Map<String, List<String>> teachersGroups = {};

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
                MediaQuery.of(context).size.height * 0.5,
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
                            style: TextStyle(color: Colors.green))),    
                    DataColumn(
                        label: Text('Groups Ids',
                            style: TextStyle(color: Colors.green))),
                    DataColumn(
                        label: Text(' ',
                            style: TextStyle(color: Colors.green))),
                  ],
                  
                  rows: teacherData.map(
                    (teacher) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(teacher['teacher_id'], style: const TextStyle(color: Colors.white))),
                        DataCell(
                          FutureBuilder<List<Map<String, dynamic>>>(
                            future: GroupsTeachersData.getAllGroupsTeachers(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator(); // Placeholder while loading
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                // Filter working days for the current teacher
                                List<String> groups = snapshot.data!
                                    .where((group) => group['teacher_id'] == teacher['teacher_id'])
                                    .map((group) => group['group_id'].toString())
                                    .toList();
                                
                                if (groups.isEmpty) {
                                  return Text('none', style: const TextStyle(color: Colors.white));
                                } else {
                                  return Text(groups.join(', '), style: const TextStyle(color: Colors.white));
                                }
                              }
                            },
                          ),
                        ),
                        DataCell(
                          IconButton(
                            color: Colors.white,
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              print(teacher['teacher_id']);
                              GroupsTeachersData.deleteGroupsTeachers(teacher['teacher_id']);
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
          await teachergroupAddRowDialog(context);
          _fetchTeachers();
        },
        backgroundColor: Color.fromARGB(255, 143, 226, 148),
        child: const Icon(Icons.add,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
