import 'package:flutter/material.dart';
import '/Courses/Subjects.dart';
import '/widgets/cardnav.dart';
import '../widgets/leftnavigator.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key});
  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
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

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
      alignment: WrapAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Subjects(field:'Computer Science')), // Replace with GroupsPage constructor if needed
            );
          },
          child: const CardNav(
          title:"Computer Science", subtitle:"",
          color:Color.fromARGB(255, 78, 194, 212), 
          buttonText:'Show subjects', type:'course', course_type: 'Cs',),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Subjects(field: 'Mathematics',)), // Replace with GroupsPage constructor if needed
            );
          },
          child:const CardNav(
            title:"Mathematics", subtitle:"",
            color:Color.fromARGB(255, 78, 194, 212), 
            buttonText:'Show subjects', type:'course', course_type: 'Mth',),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Subjects(field: 'Statistics',)), // Replace with GroupsPage constructor if needed
            );
          },
          child: const CardNav(
            title:"Statistics", subtitle:"",
            color:Color.fromARGB(255, 78, 194, 212), 
            buttonText:'Show subjects', type:'course', course_type: 'Stc',),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Subjects(field: 'Business & Entrepreneurship',)), // Replace with GroupsPage constructor if needed
            );
          },
          child: const CardNav(
            title:"Business & Entrepreneurship", subtitle:"",
            color:Color.fromARGB(255, 78, 194, 212),  
            buttonText:'Show subjects', type:'course', course_type: 'BE',),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Subjects(field: 'English',)), // Replace with GroupsPage constructor if needed
            );
          },
          child: const CardNav(
            title:"English", subtitle:"",
            color:Color.fromARGB(255, 78, 194, 212),
            buttonText:'Show subjects', type:'course', course_type: 'Eng',),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Subjects(field: 'Organizational Psychology',)), // Replace with GroupsPage constructor if needed
            );
          },
          child: const CardNav(
            title:"Organizational Psychology", subtitle:"",
            color:Color.fromARGB(255, 78, 194, 212),
            buttonText:'Show subjects', type:'course', course_type: 'OP',),
        ),
      ],
    ));
  }

}
