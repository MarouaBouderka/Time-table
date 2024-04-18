import 'package:flutter/material.dart';
import '/Courses/Subjects.dart';
import '/widgets/Dialogs.dart';
import '/Resources/Rooms.dart';

class CardNav extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final String buttonText;
  final String type;
  final String room_type;
  final String year;
  final String course_type;
  final String path;
  final String sheet;

  const CardNav( {
    super.key, 
    required this.title, 
    required this.subtitle, 
    required this.buttonText, 
    required this.type, 
    this.color = Colors.white, 
    this.room_type='', 
    this.year='',
    this.course_type='',
    this.path='',
    this.sheet=''
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Card(
        color: const Color.fromARGB(255, 55, 57, 58),
        elevation: 4,
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 219, 219, 219),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, bottom: 8),
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
                child: Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(color),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Adjust border radius as needed
                        ),
                      ),
                      // Set background color to transparent
                    ),
                    onPressed: () 
                    {
                      if (type == 'room') {
                        print('###\n${room_type}\n###');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Rooms(type: room_type)), 
                        );
                      } else
                      if (type == 'course') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Subjects(field: title,)), // Replace with GroupsPage constructor if needed
                        );
                      } else if (type == 'distribution')
                      {
                        sectionDialog(context, year);
                      }
                    },
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 219, 219, 219),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
