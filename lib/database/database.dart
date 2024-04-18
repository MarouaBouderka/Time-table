import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// Ensure proper initialization of databaseFactory
void initializeDatabaseFactory() async {
  databaseFactory = databaseFactoryFfi;
}

class Timetable_DB {
  static const _database_name = "timetableDB.db";
  static const _database_version = 1;
  static var database;

  static Future getDatabase() async {
    initializeDatabaseFactory(); // Ensure initialization
    if (database != null) {
      print(
          '\n\n\n********************** db is not null **********************\n\n\n');
      return database;
    }
    final path = join(await getDatabasesPath(), _database_name);
    database = await openDatabase(
      path,
      onCreate: (myMTH, version) {
        print('\n\n\n*****************' + path + '********************\n\n\n');
        myMTH.execute('''
          CREATE TABLE rooms(
            room_id TEXT,
            room_type TEXT,
            session_type TEXT,
            room_capacity INTEGER
          )
          ''');
        myMTH.execute('''
          CREATE TABLE working_days(
            teacher_id TEXT,
            week_day TEXT
          )
          ''');
        myMTH.execute('''
          CREATE TABLE teachers(
            teacher_id TEXT,
            teacher_name TEXT,
            teacher_grade TEXT,
            field TEXT
          )
          ''');
        myMTH.execute('''
          CREATE TABLE subjects(
            subject_id TEXT,
            subject_title TEXT,
            field TEXT,
            subject_category TEXT,
            year INTEGER,
            semester INTEGER
          )
          ''');
        myMTH.execute('''
          CREATE TABLE groups(
            group_id TEXT,	
            group_year INTEGER,
            group_section	INTEGER,
            group_number INTEGER,
            student_number INTEGER
          )
          ''');
      },
      version: _database_version,
      onUpgrade: (database, oldVersion, newVersion) {},
    );
    return database;
  }
  
}
