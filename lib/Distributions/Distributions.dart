import 'package:flutter/material.dart';
import '../widgets/cardnav.dart';
import '../widgets/leftnavigator.dart';

class Distributions extends StatefulWidget {
  const Distributions({Key? key});

  @override
  State<Distributions> createState() => _DistributionsState();
}

class _DistributionsState extends State<Distributions> {

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
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 0.0, left: 20),
              child: Center(
                child: SingleChildScrollView(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      CardNav(
                        title: "Academic Year 1", subtitle:"240",
                          color: Color.fromARGB(255, 147, 121, 255), 
                          buttonText:'Show sections', type:'distribution', year: '1',),
                      CardNav(
                        title: "Academic Year 2", subtitle:"240",
                          color: Color.fromARGB(255, 147, 121, 255), 
                          buttonText:'Show sections', type:'distribution', year: '2',),
                      CardNav(
                        title: "Academic Year 3", subtitle:"240",
                          color: Color.fromARGB(255, 147, 121, 255),
                          buttonText:'Show sections', type:'distribution', year: '3',),
                      CardNav(
                        title: "Academic Year 4", subtitle:"240",
                          color: Color.fromARGB(255, 147, 121, 255),
                          buttonText:'Show sections', type:'distribution', year: '4',),
                      CardNav(
                        title: "Academic Year 5", subtitle:"240",
                          color: Color.fromARGB(255, 147, 121, 255),
                          buttonText:'Show sections', type:'distribution', year: '5',)
                    ],
                  )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

