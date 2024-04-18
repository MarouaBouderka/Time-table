import 'package:flutter/material.dart';
import '../database/helper_fct.dart';
import '../widgets/Dialogs.dart';
import '../widgets/leftnavigator.dart';

class Subjects extends StatefulWidget {
  final String field;

  const Subjects({
    Key? key,
    required this.field,
  }) : super(key: key);

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  List<Map<String, dynamic>> subjectData = [];

  @override
  void initState() {
    super.initState();
    _fetchSubjects();
  }

  Future<void> _fetchSubjects() async {
    try {
      subjectData = await SubjectsData.getSubject();
      setState(() {});
    } catch (e) {
      print('Error fetching subjects: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredSubjects = subjectData.where((subject) => subject['field'] == widget.field).toList();
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
                MediaQuery.of(context).size.height * 0.2,
                MediaQuery.of(context).size.height * 0.1,
                0,
                0),
            child: Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                        label: Text('Subject Code',
                            style: TextStyle(
                                color: Color.fromARGB(255, 33, 208, 243)))),
                    DataColumn(
                        label: Text('Subject Title',
                            style: TextStyle(
                                color: Color.fromARGB(255, 33, 208, 243)))),
                    DataColumn(
                        label: Text('Subject Category',
                            style: TextStyle(
                                color: Color.fromARGB(255, 33, 208, 243)))),
                    DataColumn(
                        label: Text('Year',
                            style: TextStyle(
                                color: Color.fromARGB(255, 33, 208, 243)))),
                    DataColumn(
                        label: Text('Semester',
                            style: TextStyle(
                                color: Color.fromARGB(255, 33, 208, 243)))),
                    DataColumn(
                        label: Text('',
                            style: TextStyle(
                                color: Color.fromARGB(255, 33, 208, 243)))),
                  ],
                  rows: filteredSubjects.map(
                    (subject) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(subject['subject_id'], style: const TextStyle(color: Colors.white))),
                        DataCell(Text(subject['subject_title'], style: const TextStyle(color: Colors.white))),
                        DataCell(Text(subject['subject_category'], style: const TextStyle(color: Colors.white))),
                        DataCell(Text(subject['year'].toString(), style: const TextStyle(color: Colors.white))),
                        DataCell(Text(subject['semester'].toString(), style: const TextStyle(color: Colors.white))),
                        DataCell(
                          IconButton(
                            color: Colors.white,
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              SubjectsData.deleteSubject(subject['subject_id']);
                              _fetchSubjects();
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
          await subjectsAddRowDialog(context, widget.field);
          _fetchSubjects(); // Refresh rows after adding a new subject
        },
        backgroundColor: Color.fromARGB(255, 92, 220, 255),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
