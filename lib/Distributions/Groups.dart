// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_db_local/database/helper_fct.dart';
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
  List<Map<String,dynamic>> groupData = [];
  
  @override
  void initState() {
    super.initState();
    _fetchGroups();
  }

  Future<void> _fetchGroups() async {
    try {
      groupData = await GroupsData.getGroups();
      setState(() {});
    } catch (e) {
      print('Error fetching subjects: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredGroups = groupData.where((group) => group['group_section'] == int.parse(widget.section) && group['group_year'] == int.parse(widget.year)).toList();
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
                    DataColumn(label: Text('', style: TextStyle(color: Colors.deepPurple))),
                  ],
                  rows: filteredGroups.map(
                    (group) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(group['group_id'].toString(), style: const TextStyle(color: Colors.white))),
                        DataCell(Text(group['group_year'].toString(), style: const TextStyle(color: Colors.white))),
                        DataCell(Text(group['group_section'].toString(), style: const TextStyle(color: Colors.white))),
                        DataCell(Text(group['group_number'].toString(), style: const TextStyle(color: Colors.white))),
                        DataCell(Text(group['student_number'].toString(), style: const TextStyle(color: Colors.white))),
                        DataCell(
                          IconButton(
                            color: Colors.white,
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              GroupsData.deleteGroups(group['group_id']);
                              _fetchGroups();
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
          await groupsAddRowDialog(context, int.parse(widget.year), int.parse(widget.section));
          _fetchGroups();
        },
        backgroundColor: const Color.fromARGB(255, 130, 95, 191),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}


