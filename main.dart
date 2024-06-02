import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

// Data model for timetable cell
class TimetableCell {
  final String teacherName;
  final String subject;
  final String roomName;

  TimetableCell({
    required this.teacherName,
    required this.subject,
    required this.roomName,
  });
}

// Widget for timetable cell
class TimetableCellWidget extends StatelessWidget {
  final TimetableCell cell;

  TimetableCellWidget({required this.cell});

  @override
  Widget build(BuildContext context) {
    return Draggable<TimetableCell>(
      data: cell,
      child: IntrinsicWidth(
          child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 25, 25, 26),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.transparent),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Teacher: ${cell.teacherName}',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Subject: ${cell.subject}',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Room: ${cell.roomName}',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      )),
      feedback: Material(child: TimetableCellWidget(cell: cell)),
      childWhenDragging: Container(),
    );
  }
}

class TimetableTable extends StatefulWidget {
  @override
  _TimetableTableState createState() => _TimetableTableState();
}

class _TimetableTableState extends State<TimetableTable> {
  List<TimetableCell> cells = [
    TimetableCell(
        teacherName: 'Teacher 1', subject: 'Math', roomName: 'Room A'),
    TimetableCell(
        teacherName: 'Teacher 3', subject: 'Math', roomName: 'Room C'),
    TimetableCell(
        teacherName: 'Teacher 2', subject: 'Science', roomName: 'Room B'),
    TimetableCell(
        teacherName: 'Teacher 5', subject: 'Science', roomName: 'Room K'),
    TimetableCell(
        teacherName: 'Teacher 8', subject: 'Science', roomName: 'Room J'),
    TimetableCell(
        teacherName: 'Teacher 1', subject: 'Math', roomName: 'Room A'),
    TimetableCell(
        teacherName: 'Teacher 3', subject: 'Math', roomName: 'Room C'),
    TimetableCell(
        teacherName: 'Teacher 2', subject: 'Science', roomName: 'Room B'),
    TimetableCell(
        teacherName: 'Teacher 13', subject: 'Science', roomName: 'Room M'),
    TimetableCell(
        teacherName: 'Teacher 8', subject: 'Science', roomName: 'Room J'),
  ];
  int n_columns = 5;
  int n_rows = 2;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: List.generate(
        n_rows, //  of rows
        (rowIndex) => TableRow(
          children: List.generate(
            5, //  number of columns
            (colIndex) {
              final index = rowIndex * n_columns +
                  colIndex; // change this 3la 7sab n of cols ( 5 ? ) ...
              final cell = cells[index];
              return TableCell(
                child: DragTarget<TimetableCell>(
                  onWillAcceptWithDetails: (data) {
                    return cells[index] != null;
                  },
                  onAcceptWithDetails: (data) {
                    setState(() {
                      if (data != Null &&
                          data.data != Null &&
                          check_constraints(
                              data.data, index % n_columns, cells, n_columns) &&
                          check_constraints(
                              cells[index],
                              cells.indexOf(data.data) % n_columns,
                              cells,
                              n_columns)) {
                        print("changing ...");
                        var temp = data.data;
                        cells[cells.indexOf(data.data)] = cells[index];
                        cells[index] = temp;
                      } else {
                        print("Opps");
                      }
                    });
                  },
                  builder: (BuildContext context, List<dynamic> candidateData,
                      List<dynamic> rejectedData) {
                    return cell != null
                        ? TimetableCellWidget(cell: cell)
                        : SizedBox(width: 100, height: 100);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

bool check_constraints(
    TimetableCell data, int index, List<TimetableCell> others, int n_columns) {
  int startOfRow = (index ~/ n_columns) * n_columns;
  for (int i = startOfRow; i < startOfRow + n_columns; i++) {
    if (i != index &&
        (data.teacherName == others[i].teacherName ||
            data.roomName == others[i].roomName)) {
      return false;
    }
  }
  return true;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TimetableTable(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
