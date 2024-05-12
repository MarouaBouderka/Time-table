import 'package:flutter/material.dart';
import 'package:flutter_application_db_local/Sessions/sessions.dart';
import '../Groups_Teachers/groups_teachers.dart';
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
  static const String groups_teachers = '/Groups_Teachers';
  static const String sessions = '/Sessions';
  static Map<String, WidgetBuilder> routes = {
    homePage: (context) => HomePage(),
    resources: (context) => Resources(),
    staff: (context) => Staff(),
    courses: (context) => Courses(),
    distributions: (context) => Distributions(),
    groups_teachers: (context) => GroupsTeachers(),
    sessions: (context) => Session()

  };
}
