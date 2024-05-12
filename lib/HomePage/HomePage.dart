// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_application_db_local/Sessions/sessions.dart';
import 'package:flutter_application_db_local/database/read_excel.dart';
import 'package:flutter_application_db_local/widgets/welcome.dart';
import '../TimeTables/timetable.dart';
import '../database/helper_fct.dart';
import '../widgets/card_widget.dart';
import '../widgets/custom_button.dart';
import '../widgets/leftnavigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: MainBody(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showWelcomeDialog(context);
        },
        child: Icon(Icons.info, size: 50,),
      ),
    );
  }
}


class Tables extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Frame(),
    );
  }
}


class MainBody extends StatelessWidget {
  TextEditingController room_path = TextEditingController();
  TextEditingController room_sheet = TextEditingController();

  TextEditingController teacher_path = TextEditingController();
  TextEditingController teacher_sheet = TextEditingController();

  TextEditingController working_days_path = TextEditingController();
  TextEditingController working_days_sheet = TextEditingController();

  TextEditingController subject_path = TextEditingController();
  TextEditingController subject_sheet = TextEditingController();

  TextEditingController group_path = TextEditingController();
  TextEditingController group_sheet = TextEditingController();

  TextEditingController session_path = TextEditingController();
  TextEditingController session_sheet = TextEditingController();

  TextEditingController teaching_path = TextEditingController();
  TextEditingController teaching_sheet = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Time Table Generator',
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 219, 219, 219)),
        ),
        const SizedBox(height: 20),
        const Text(
          '',
          style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Color.fromARGB(255, 219, 219, 219)
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10,5,5,5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black,width: 1)
                  ),
                  height: 40,
                  width: 500, 
                  child: TextFormField(
                    controller: room_path,              
                    decoration: const InputDecoration(  
                      labelText: 'Rooms xlsx File Path',
                      border:InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter path';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width:5),
                Container(
                  padding: const EdgeInsets.fromLTRB(10,5,5,5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black,width: 1)
                  ),
                  height: 40,
                  width: 350, 
                  child: TextFormField( 
                    controller: room_sheet,             
                    decoration: const InputDecoration(  
                      labelText: 'Sheet',
                      border:InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter sheet';
                      }
                      return null;
                    },    
                  ),
                ),
              ],
            ),      
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10,5,5,5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black,width: 1)
                  ),
                  height: 40,
                  width: 500, 
                  child: TextFormField( 
                    controller: teacher_path,             
                    decoration: const InputDecoration(  
                      labelText: 'Teachers xlsx File Path',
                      border:InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter path';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width:5),
                Container(
                  padding: const EdgeInsets.fromLTRB(10,5,5,5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black,width: 1)
                  ),
                  height: 40,
                  width: 350, 
                  child: TextFormField( 
                    controller: teacher_sheet,             
                    decoration: const InputDecoration(  
                      labelText: 'Sheet',
                      border:InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter sheet';
                      }
                      return null;
                    },    
                  ),
                ),
              ],
            ),     
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10,5,5,5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black,width: 1)
                  ),
                  height: 40,
                  width: 500, 
                  child: TextFormField(         
                    controller: working_days_path,     
                    decoration: const InputDecoration(  
                      labelText: 'Teachers Working Days xlsx File Path',
                      border:InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter path';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width:5),
                Container(
                  padding: const EdgeInsets.fromLTRB(10,5,5,5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black,width: 1)
                  ),
                  height: 40,
                  width: 350, 
                  child: TextFormField(      
                    controller: working_days_sheet,        
                    decoration: const InputDecoration(  
                      labelText: 'Sheet',
                      border:InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter sheet';
                      }
                      return null;
                    },    
                  ),
                ),
              ],
            ),     
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10,5,5,5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black,width: 1)
                  ),
                  height: 40,
                  width: 500, 
                  child: TextFormField(         
                    controller: group_path,     
                    decoration: const InputDecoration(  
                      labelText: 'Groups xlsx File Path',
                      border:InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter path';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width:5),
                Container(
                  padding: const EdgeInsets.fromLTRB(10,5,5,5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black,width: 1)
                  ),
                  height: 40,
                  width: 350, 
                  child: TextFormField(      
                    controller: group_sheet,        
                    decoration: const InputDecoration(  
                      labelText: 'Sheet',
                      border:InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter sheet';
                      }
                      return null;
                    },    
                  ),
                ),
              ],
            ),    
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10,5,5,5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black,width: 1)
                  ),
                  height: 40,
                  width: 500, 
                  child: TextFormField(         
                    controller: teaching_path,     
                    decoration: const InputDecoration(  
                      labelText: 'Teaching xlsx File Path',
                      border:InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter path';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width:5),
                Container(
                  padding: const EdgeInsets.fromLTRB(10,5,5,5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black,width: 1)
                  ),
                  height: 40,
                  width: 350, 
                  child: TextFormField(      
                    controller: teaching_sheet,        
                    decoration: const InputDecoration(  
                      labelText: 'Sheet',
                      border:InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter sheet';
                      }
                      return null;
                    },    
                  ),
                ),
              ],
            ),                
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10,5,5,5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black,width: 1)
                  ),
                  height: 40,
                  width: 500, 
                  child: TextFormField(  
                    controller: subject_path,            
                    decoration: const InputDecoration(
                      labelText: 'Subjects xlsx File Path',
                      border:InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter path';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width:5),
                Container(
                  padding: const EdgeInsets.fromLTRB(10,5,5,5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black,width: 1)
                  ),
                  height: 40,
                  width: 350, 
                  child: TextFormField(  
                    controller: subject_sheet,            
                    decoration: const InputDecoration(  
                      labelText: 'Sheet',
                      border:InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter path';
                      }
                      return null;
                    },    
                  ),
                ),
              ],
            ),      
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10,5,5,5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black,width: 1)
                  ),
                  height: 40,
                  width: 500, 
                  child: TextFormField(  
                    controller: session_path,            
                    decoration: const InputDecoration(
                      labelText: 'Sessions xlsx File Path',
                      border:InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter path';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width:5),
                Container(
                  padding: const EdgeInsets.fromLTRB(10,5,5,5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black,width: 1)
                  ),
                  height: 40,
                  width: 350, 
                  child: TextFormField(  
                    controller: session_sheet,            
                    decoration: const InputDecoration(  
                      labelText: 'Sheet',
                      border:InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter path';
                      }
                      return null;
                    },    
                  ),
                ),
              ],
            ),      
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 0),
              child: CustomButton(
                fill: false,
                label: "Upload Data",

                onPressed: () async{
                  print(room_path.text);
                  List<dynamic> rooms = await readExcelFile(room_path.text, room_sheet.text);
                  // Loop through rows in the sheet and insert data into the SQLite database
                  for (var i = 1; i < rooms.length; i++) {
                    var row = rooms[i];
                    Map<String, dynamic> rowData = {
                      'room_id': row[0].value.toString(),
                      'room_type': row[1].value.toString(),
                      'session_type': row[2].value.toString(),
                      'room_capacity': int.tryParse(row[3].value.toString())??0,
                      'room_availability':'False',
                    };
                    await RoomsData.insertRoom(rowData);
                  }

                  List<dynamic> teachers = await readExcelFile(teacher_path.text, teacher_sheet.text);
                  // Loop through rows in the sheet and insert data into the SQLite database
                  for (var i = 1; i < teachers.length; i++) {
                    var row = teachers[i];
                    Map<String, dynamic> rowData = {
                      'teacher_id': row[0].value.toString(),
                      'teacher_name': row[1].value.toString(),
                      'teacher_grade': row[2].value.toString(),
                      'teacher_availability': 'True',
                      'field': row[3].value.toString(),
                      'priority': row[4].value.toString(), 
                      'pereferred_period': row[5].value.toString(),
                    };
                    await TeachersData.insertTeacher(rowData);
                  }

                  List<dynamic> work_days = await readExcelFile(working_days_path.text, working_days_sheet.text);
                  // Loop through rows in the sheet and insert data into the SQLite database
                  for (var i = 1; i < work_days.length; i++) {
                    var row = work_days[i];
                    Map<String, dynamic> rowData = {
                      'teacher_id': row[0].value.toString(),
                      'week_day': row[1].value.toString(),
                    };
                    await WorkingDaysData.insertWorkingDay(rowData);
                  }

                  List<dynamic> groups = await readExcelFile(group_path.text, group_sheet.text);
                  // Loop through rows in the sheet and insert data into the SQLite database
                  for (var i = 1; i < groups.length; i++) {
                    var row = groups[i];
                    Map<String, dynamic> rowData = {
                      'group_id': row[0].value.toString(),
                      'group_year': int.tryParse(row[1].value.toString())??0,
                      'group_section': int.tryParse(row[2].value.toString())??0,
                      'group_number': int.tryParse(row[3].value.toString())??0,
                      'student_number': int.tryParse(row[4].value.toString())??0,
                    };
                    await GroupsData.insertGroup(rowData);
                  }

                  List<dynamic> teaching = await readExcelFile(teaching_path.text, teaching_path.text);
                  // Loop through rows in the sheet and insert data into the SQLite database
                  for (var i = 1; i < teaching.length; i++) {
                    var row = teaching[i];
                    Map<String, dynamic> rowData = {
                      'teacher_id': row[0].value.toString(),
                      'group_id': row[1].value.toString(),
                    };
                    await GroupsTeachersData.insertGroupsTeachers(rowData);
                  }

                  List<dynamic> subjects = await readExcelFile(subject_path.text, subject_sheet.text);
                  // Loop through rows in the sheet and insert data into the SQLite database
                  for (var i = 1; i < subjects.length; i++) {
                    var row = subjects[i];
                    Map<String, dynamic> rowData = {
                      'subject_id': row[0].value.toString(),
                      'subject_title': row[1].value.toString(),
                      'field': row[2].value.toString(),
                      'subject_category': row[3].value.toString(),
                      'year': int.tryParse(row[4].value.toString())??0,
                      'semester': int.tryParse(row[5].value.toString())??0,
                    };
                    await SubjectsData.insertSubject(rowData);
                  }

                  List<dynamic> sessions = await readExcelFile(session_path.text, session_sheet.text);
                  // Loop through rows in the sheet and insert data into the SQLite database
                  for (var i = 1; i < sessions.length; i++) {
                    var row = sessions[i];
                    Map<String, dynamic> rowData = {
                      'session_id': row[0].value.toString(),
                      'subject_id': row[1].value.toString(),
                      'session_type': row[2].value.toString(),
                      'nb_of_sessions_per_week': row[3].value.toString(),
                    };
                    await SessionsData.insertSession(rowData);
                  }
                  // Show a SnackBar indicating successful upload
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Data uploaded successfully'),
                    ),
                  );
                },

              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 0),
              child: CustomButton(
                fill: true,
                label: "Generate Timetables",
                onPressed: (){
                },
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(height: 50),
        Wrap(
          children: [
            InkWell(
              child: const CardWidget(
                label: 'Resources',
                progress: 0.15,
                color: Colors.orange,
                imageAsset: 'lib/icons/36_r.png',
              ),
              onTap: () {
              },
            ),
            const SizedBox(height: 100, width: 10),
            InkWell(
              child: const CardWidget(
                label: 'Staff',
                progress: 0.15,
                color: Colors.yellow,
                imageAsset: 'lib/icons/t_36.png',
              ),
              onTap: () {
              },
            ),
            const SizedBox(height: 100, width: 10),
            InkWell(
              child: const CardWidget(
                label: 'Distributions',
                progress: 0.15,
                color: Colors.blue,
                imageAsset: 'lib/icons/36_q.png',
              ),
              onTap: () {
              },
            ),
            const SizedBox(height: 100, width: 10),
            InkWell(
              child: const CardWidget(
                label: 'Sections',
                progress: 0.15,
                color: Colors.purpleAccent,
                imageAsset: 'lib/icons/36_s.png',
              ),
              onTap: (){},
            ),
            const SizedBox(height: 100, width: 10),
            const CardWidget(
              label: 'Active Years',
              progress: 0.15,
              color: Colors.green,
              imageAsset: 'lib/icons/36_b.png',
            ),
            const SizedBox(height: 100, width: 10),
            const CardWidget(
              label: 'TimeTables',
              progress: 0.15,
              color: Colors.deepPurple,
              imageAsset: 'lib/icons/36_c.png',
            ),
            const SizedBox(height: 100, width: 10),
            const SizedBox(
              width: 700,
              child: Text('Timetables', style: TextStyle(color: Colors.white, fontSize: 30),),
            ),
            const SizedBox(height: 50, width: 700),
            SizedBox(
              width: 700,
              child:Frame(),
            ),
            const SizedBox(height: 70, width: 700),
            SizedBox(
              width: 700,
              child:Frame(),
            ),
            const SizedBox(height: 70, width: 700),
            SizedBox(
              width: 700,
              child:Frame(),
            ),
            const SizedBox(height: 70, width: 10),
          ],
        )
      ],
    ));
  }
}

