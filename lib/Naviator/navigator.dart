import 'package:flutter/material.dart';
import '../Courses/Fields.dart';
import '../Distributions/Distributions.dart';
import '../HomePage/HomePage.dart';
import '../Resources/Resources.dart';
import '../Staff/Staff.dart';

class AppRoutes {
  static const String homePage = '/HomePage';
  static const String resources = '/Resources';
  static const String staff = '/Staff';
  static const String courses = '/Courses';
  static const String distributions = '/Distributions';
  static const String labRooms= '/labRooms';
  static Map<String, WidgetBuilder> routes = {
    homePage: (context) => HomePage(),
    resources: (context) => Resources(),
    staff: (context) => Staff(),
    courses: (context) => Courses(),
    distributions: (context) => Distributions(),
  };
}
