import 'package:flutter/material.dart';

import '../Naviator/navigator.dart';

class _NavigationItemState extends State<NavigationItem> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovering = false;
        });
      },
      child: GestureDetector(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                widget.iconPath,
                width: 36, // Adjust size as needed
                height: 36, // Adjust size as needed
              ),
            ),
            SizedBox(height: height / 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: 12,
                  color: isHovering ? widget.color : Colors.white70,
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.pushReplacementNamed(context, widget.route);
        },
      ),
    );
  }
}

class NavigationItem extends StatefulWidget {
  final String iconPath;
  final String label;
  final String route;
  final Color color;

  const NavigationItem({
    required this.iconPath,
    required this.label,
    required this.route,
    required this.color,
  });

  @override
  _NavigationItemState createState() => _NavigationItemState();
}

class LeftNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 50),
        Image(
          image: AssetImage('lib/icons/36.png'),
          width: 36, // Adjust size as needed
          height: 36, // Adjust size as needed
        ),
        SizedBox(height: 50), // Adjust spacing as needed
        SizedBox(height: 20), // Adjust spacing as needed
        NavigationItem(
          iconPath: 'lib/icons/64_h.png',
          label: 'Home',
          route: AppRoutes.homePage,
          color: Colors.green,
        ),
        NavigationItem(
          iconPath: 'lib/icons/64_r.png',
          label: 'Resources',
          route: AppRoutes.resources,
          color: Colors.orange,
        ),
        NavigationItem(
          iconPath: 'lib/icons/64_tc.png',
          label: 'Staff',
          route: AppRoutes.staff,
          color: Colors.yellow,
        ),
        NavigationItem(
          iconPath: 'lib/icons/64_c.png',
          label: 'Courses',
          route: AppRoutes.courses,
          color: Color.fromARGB(255, 33, 208, 243),
        ),
        NavigationItem(
          iconPath: 'lib/icons/64_g.png',
          label: 'Distributions',
          route: AppRoutes.distributions,
          color: Colors.deepPurple,
        ),
      ],
    );
  }
}
