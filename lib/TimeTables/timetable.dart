import 'package:flutter/material.dart';



class Frame extends StatelessWidget {
  final List<String> daysOfWeek = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
  final List<String> sessionHours = ['08:00', '10:00', '12:00', '14:00', '16:00', '18:00'];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.circular(10)),
            child: const Text(
              'Y:1 S:1 G:1',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color.fromARGB(255, 245, 247, 248),
                fontSize: 20,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Table(
            columnWidths: const {0: FixedColumnWidth(60)},
            children: _buildTableRows(),
          ),
        ],
      ),
    );
  }

  List<TableRow> _buildTableRows() {
    List<TableRow> rows = [
      TableRow(
        children: [
          SizedBox.shrink(), // Empty top-left cell
          for (var day in daysOfWeek) _dayButton(day),
        ],
      ),
    ];

    for (var i = 0; i < sessionHours.length; i++) {
      rows.add(
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(sessionHours[i], style: TextStyle(color: Colors.white),), // Session time
            ),
            for (var j = 0; j < daysOfWeek.length; j++) _classCell(j, i), // Session cells
          ],
        ),
      );
    }

    return rows;
  }

  Widget _dayButton(String day) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      child: Text(
        day,
        style: TextStyle(
          color: Color(0xFFC7CFD6),
          fontSize: 12,
          fontFamily: 'Ubuntu',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _classCell(int dayIndex, int sessionIndex) {
    List<Color> colors = [
      Color(0xFFFF5959),
      Color(0xFF9279FF),
      Color(0xFF5DC9FF),
      Color(0xFF32E6B7),
      Color(0xFF82D930),
      Color(0xFFD9CF25),
      Color(0xFFC7CFD6),
    ];

    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colors[dayIndex % colors.length],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        'S${sessionIndex + 1}', // Simplified label for sessions
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: 'Ubuntu',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
