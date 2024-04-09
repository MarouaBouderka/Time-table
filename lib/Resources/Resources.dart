import 'package:flutter/material.dart';
import '/Naviator/navigator.dart';
import '/Resources/Rooms.dart';

import '../widgets/cardnav.dart';
import '../widgets/leftnavigator.dart';

class Resources extends StatefulWidget {
  const Resources({Key? key});

  @override
  State<Resources> createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
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
              child: Center(
                child: MainBody(),
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
              MaterialPageRoute(builder: (context) => const Rooms(type: 'Tuto',)), // Replace with GroupsPage constructor if needed
            );
          },
          child: const CardNav(
            title:"Tutorial Rooms", 
            subtitle: "150 ROOM",
            color: Color.fromARGB(255, 230, 175, 91), 
            buttonText:'Add',
            type:'room',
            room_type: 'tuto',
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Rooms(type: 'Lab',)), // Replace with GroupsPage constructor if needed
            );
          },
          child: const CardNav(
            title:"Labs", 
            subtitle: "150 ROOM",
            color: Color.fromARGB(255, 230, 175, 91), 
            buttonText:'Add',
            type:'room',
            room_type: 'lab',
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Rooms(type: 'Amphi',)), // Replace with GroupsPage constructor if needed
            );
          },
          child: const CardNav(
            title:"Amphitheaters", 
            subtitle: "8 ROOM",
            color: Color.fromARGB(255, 230, 175, 91), 
            buttonText:'Add',
            type:'room',
            room_type: 'amphi',
          ),
        ),
      ],
    ));
  }
}
