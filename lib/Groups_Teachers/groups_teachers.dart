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
  List<dynamic> teachersGroups = [];

  @override
  void initState() {
    super.initState();
    _fetchTeachersGroups();
  }

  Future<void> _fetchTeachersGroups() async {
    try {
      teachersGroups = await GroupsTeachersData.getAllGroupsTeachers();
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
                        label: Text('Groups Id',
                            style: TextStyle(color: Colors.green))),
                    DataColumn(
                        label: Text('Session Id',
                            style: TextStyle(color: Colors.green))),
                    DataColumn(
                        label: Text(' ',
                            style: TextStyle(color: Colors.green))),
                  ],
                  
                  rows: teachersGroups.map(
                    (teaching) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(teaching['teacher_id'], style: const TextStyle(color: Colors.white))),
                        DataCell(Text(teaching['group_id'], style: const TextStyle(color: Colors.white))),
                        DataCell(Text(teaching['session_id'], style: const TextStyle(color: Colors.white))),
                        DataCell(
                          IconButton(
                            color: Colors.white,
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              print(teaching['teaching_id']);
                              GroupsTeachersData.deleteGroupsTeachers(teaching['teaching_id']);
                              _fetchTeachersGroups();
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
          _fetchTeachersGroups();
        },
        backgroundColor: Color.fromARGB(255, 143, 226, 148),
        child: const Icon(Icons.add,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
