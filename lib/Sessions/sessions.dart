// ignore_for_file: non_constant_identifier_names, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_db_local/database/helper_fct.dart';
import '/widgets/Dialogs.dart';
import '../widgets/leftnavigator.dart'; // Assuming you have this widget defined

class Session extends StatefulWidget {
  const Session({
    super.key, 
  });
  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> {
  List<Map<String, dynamic>> sessionData = [];

  @override
  void initState() {
    super.initState();
    _fetchSessions();
  }

  Future<void> _fetchSessions() async {
    try {
      sessionData = await SessionsData.getSessions();
      setState(() {});
    } catch (e) {
      print('Error fetching sessions: $e');
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
                MediaQuery.of(context).size.height * 0.3,
                MediaQuery.of(context).size.height * 0.1,
                0,
                0),
            child: Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  dataRowHeight: 100,
                  columns: const <DataColumn>[
                    DataColumn(
                        label: Text('Session Id',
                            style: TextStyle(color: Color.fromARGB(255, 197, 87, 182)))),
                    DataColumn(
                        label: Text('Subject Id',
                            style: TextStyle(color: Color.fromARGB(255, 197, 87, 182)))),
                    DataColumn(
                        label: Text('Session Type',
                            style: TextStyle(color: Color.fromARGB(255, 197, 87, 182)))),
                    DataColumn(
                        label: Text('Nb of Sessions Per Week',
                            style: TextStyle(color: Color.fromARGB(255, 197, 87, 182)))),
                    DataColumn(
                        label: Text(' ',
                            style: TextStyle(color: Color.fromARGB(255, 197, 87, 182)))),
                  ],
                  
                  rows: sessionData.map(
                    (session) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(session['session_id'], style: const TextStyle(color: Colors.white))),
                        DataCell(Text(session['subject_id'], style: const TextStyle(color: Colors.white))),
                        DataCell(Text(session['session_type'], style: const TextStyle(color: Colors.white))),
                        DataCell(Text(session['nb_of_sessions_per_week'], style: const TextStyle(color: Colors.white))),
                        DataCell(
                          IconButton(
                            color: Colors.white,
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              SessionsData.deleteSession(session['session_id']);
                              _fetchSessions();
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
          await sessionAddRowDialog(context);
          _fetchSessions();
        },
        backgroundColor: Color.fromARGB(255, 223, 111, 208),
        child: const Icon(Icons.add,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
