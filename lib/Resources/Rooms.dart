import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_db_local/database/helper_fct.dart';
import '/widgets/Dialogs.dart';
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
  List<Map<String, dynamic>> roomData = [];

  @override
  void initState() {
    super.initState();
    _fetchRooms();
  }

  Future<void> _fetchRooms() async {
    try {
      roomData = await RoomsData.getAllRooms();
      setState(() {});
    } catch (e) {
      print('Error fetching rooms: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    final filteredRooms = roomData.where((room) => room['room_type'] == widget.type).toList();

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
                    DataColumn(label: Text('', style: TextStyle(color: Colors.orange))),
                  ],
                  rows: filteredRooms.map(
                    (room) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(room['room_id'], style: const TextStyle(color: Colors.white))),
                        DataCell(Text(room['room_type'], style: const TextStyle(color: Colors.white))),
                        DataCell(Text(room['room_capacity'].toString(), style: const TextStyle(color: Colors.white))),
                        DataCell(
                          IconButton(
                            color: Colors.white,
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              RoomsData.deleteRoom(room['room_id']);
                              _fetchRooms();
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
        onPressed: () async{
          await roomsAddRowDialog(context, widget.type);
          _fetchRooms();
        },
        backgroundColor: Color.fromARGB(255, 255, 193, 99),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}


