import 'package:flutter/material.dart';
import 'package:flutter_application_1/Distributions/Distributions.dart';
import 'package:flutter_application_1/Resources/Resources.dart';
import 'package:flutter_application_1/Resources/Rooms.dart';
import 'package:flutter_application_1/Staff/Staff.dart';
import 'package:flutter_application_1/widgets/card_widget.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import '../TimeTables/timetable.dart';
import '/Naviator/navigator.dart';
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
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, 
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'TIME TABLE GENERATOR',
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 219, 219, 219)),
        ),
        const SizedBox(height: 20),
        const Text(
          'Scheduling has never been easier.',
          style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Color.fromARGB(255, 219, 219, 219)
          ),
        ),
        const SizedBox(height: 100),
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
                  width: 200, 
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
                  width: 200, 
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
                  width: 200, 
                  child: TextFormField( 
                    controller: teacher_path,             
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
                  width: 200, 
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
                  width: 200, 
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
                  width: 200, 
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
                  width: 200, 
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
                  width: 200, 
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
                  width: 200, 
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
                  width: 200, 
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
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 0),
              child: CustomButton(
                fill: false,
                label: "Generate Timetables",
                onPressed: () async{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Values saved to shared preferences'),
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
                label: "Generate Exam Timetables",
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
            Container(
              child: const Text('Timetables', style: TextStyle(color: Colors.white, fontSize: 30),),
              width: 700,
            ),
            const SizedBox(height: 50, width: 700),
            Container(
              width: 700,
              child:Frame(),
            ),
            const SizedBox(height: 70, width: 700),
            Container(
              width: 700,
              child:Frame(),
            ),
            const SizedBox(height: 70, width: 700),
            Container(
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

