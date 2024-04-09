import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import '/Naviator/navigator.dart';

import 'HomePage/HomePage.dart';

void main() {
  sqfliteFfiInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TTM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(
            0xFF181818,
            <int, Color>{
              50: Color(0xFF181818),
              100: Color(0xFF181818),
              200: Color(0xFF181818),
              300: Color(0xFF181818),
              400: Color(0xFF181818),
              500: Color(0xFF181818),
              600: Color(0xFF181818),
              700: Color(0xFF181818),
              800: Color(0xFF181818),
              900: Color(0xFF181818),
            },
          ),
        ).copyWith(
          secondary:
              const Color.fromARGB(255, 44, 45, 48), // Custom secondary color
          secondaryContainer:
              const Color.fromARGB(8, 199, 207, 114), // Custom secondary color
        ),
        useMaterial3: true,
      ),
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.homePage,
      home: HomePage(),
    );
  }
}
