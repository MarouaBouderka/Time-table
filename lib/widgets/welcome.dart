import 'package:flutter/material.dart';

void showWelcomeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Welcome to our SW Time Table Generator!",
                style: TextStyle(color: Color.fromARGB(255, 39, 176, 139)),
               ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "   We're thrilled to have you here. With our tool, crafting your perfect timetable has never been easier. You have two convenient options to input your data:",
                style: TextStyle(color: Colors.white)
              ),
              const SizedBox(height: 10),
              const Text(
                "     1. Manual Entry:\n Enter your data instance by instance directly into our interface. It's quick, intuitive, and gives you full control over every detail.",
                style: TextStyle(color: Colors.white)
              ),
              const SizedBox(height: 10),
              const Text(
                "     3. Excel Upload:\n Prefer to work from your Excel files? No problem! You can upload your data seamlessly. Just ensure that the columns in each table are in\n a specific order. Here's the required order for each table:",
                style: TextStyle(color: Colors.white)
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(border: Border.all(color: const Color.fromARGB(255, 39, 176, 139))),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(
                      '   . Rooms: room_id, room_type, session_type, room_capacity (int)',
                      style: TextStyle(color: Colors.white,fontSize: 17)
                    ),
                    Text(
                      '   . Teachers: teacher_id, teacher_name, teacher_grade, field, priority (High, Low), preferred_period (m: morning, f: afternoon)',
                      style: TextStyle(color: Colors.white,fontSize: 17)
                    ),
                    Text(
                      '   . Teachers Working Days: teacher_id, week_day',
                      style: TextStyle(color: Colors.white,fontSize: 17)
                    ),
                    Text(
                      '   . Groups: group_id, group_year(int), group_section(int), group_number(int), student_number(int)',
                      style: TextStyle(color: Colors.white,fontSize: 17)
                    ),
                    Text(
                      '   . Teaching: teacher_id, group_id',
                      style: TextStyle(color: Colors.white,fontSize: 17)
                    ),
                    Text(
                      '   . Subjects: subject_id, subject_title, field, subject_category, year(int), semester(int)',
                      style: TextStyle(color: Colors.white,fontSize: 17)
                    ),
                    Text(
                      '   . Sessions: session_id, subject_id, session_type, nb_of_sessions_per_week(int)',
                      style: TextStyle(color: Colors.white,fontSize: 17)
                    ),
                    const SizedBox(height: 10),
                    Row(children:[
                      Icon(Icons.priority_high, color: Colors.white,),
                      Text(
                        "Remember, for the Excel upload option, the column names don't matter as long as the order matches the specified format above.",
                        style: TextStyle(color: Colors.white,fontSize: 17)
                      )
                    ]),
                  ]
                )
              ),
              const Text(
                "\n Ready to streamline your scheduling process? Let's get started!",
                style: TextStyle(color: Colors.white, fontSize: 20)
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Start", style: TextStyle(color: const Color.fromARGB(255, 39, 176, 139)),),
          ),
        ],
      );
    },
  );
}
