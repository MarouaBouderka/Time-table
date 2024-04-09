import 'package:flutter_application_1/database/database.dart';
import 'package:sqflite/sqflite.dart';

//ROOMS
class RoomsData {
  static Future<List<Map<String, dynamic>>> getAllRooms() async {
    final database = await Timetable_DB.getDatabase();
    return database.rawQuery('''SELECT 
      rooms.rooms_id,
      rooms.room_type,
      rooms.session_type,          
      rooms.room_capacity
      FROM rooms
    ''');
  }
  static Future insertRoom(Map<String, dynamic> row,) async {
    final database = await Timetable_DB.getDatabase();
    database.insert("rooms", row,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static void deleteRoom(int id) async {
    final database = await Timetable_DB.getDatabase();
    database.rawQuery(
        """delete from rooms where rooms_id=?""", [id]);
  }
}

//WORKING_DAYS
class WorkingDaysData {
  static Future<List<Map<String, dynamic>>> getAllWorkingDays() async {
    final database = await Timetable_DB.getDatabase();
    return database.rawQuery('''SELECT 
      working_days.teacher_id,
      working_days.week_day
      FROM working_days
    ''');
  }
  static Future insertWorkingDay(Map<String, dynamic> row,) async {
    final database = await Timetable_DB.getDatabase();
    database.insert("week_day", row,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static void deleteWorkingDay(int id_day, int id_teacher) async {
    final database = await Timetable_DB.getDatabase();
    await database.rawDelete(
      "DELETE FROM working_days WHERE week_day = ? AND teacher_id = ?",[id_day, id_teacher]);
  }
}


//TEACHER
class TeachersData {
  static Future<List<Map<String, dynamic>>> getTeacher() async {
    final database = await Timetable_DB.getDatabase();
    return database.rawQuery('''SELECT 
      teachers.teacher_id,
      teachers.teacher_name,
      teachers.teacher_grade,
      teachers.field
      FROM teachers
    ''');
  }
  static Future insertTeacher(Map<String, dynamic> row,) async {
    final database = await Timetable_DB.getDatabase();
    database.insert("teachers", row,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static void deleteTeacher(int id) async {
    final database = await Timetable_DB.getDatabase();
    await database.rawDelete(
      "DELETE FROM teachers WHERE teacher_id = ? ",[id]);
  }
}


//SUBJECT
class SubjectsData {
  static Future<List<Map<String, dynamic>>> getSubject() async {
    final database = await Timetable_DB.getDatabase();
    return database.rawQuery('''SELECT 
      subjects.subject_id,
      subjects.subject_title,
      subjects.field,
      subjects.subject_category,
      subjects.year,
      subjects.semester
      FROM subjects
    ''');
  }
static Future insertSubject(Map<String, dynamic> row,) async {
    print(row);
    try {
        final database = await Timetable_DB.getDatabase();
        database.insert("subjects", row, conflictAlgorithm: ConflictAlgorithm.replace);
    } catch(e) {
        print('###${e}');
    }
}


  static void deleteSubject(int id) async {
    final database = await Timetable_DB.getDatabase();
    await database.rawDelete(
      "DELETE FROM subjects WHERE subject_id = ? ",[id]);
  }
}


//GROUP
class GroupsData {
  static Future<List<Map<String, dynamic>>> getGroups() async {
    final database = await Timetable_DB.getDatabase();
    return database.rawQuery('''SELECT 
      groups.group_id,
      groups.group_year,
      groups.group_section,
      groups.group_number,
      groups.student_number
      FROM groups
    ''');
  }
  static Future insertGroup(Map<String, dynamic> row,) async {
    final database = await Timetable_DB.getDatabase();
    database.insert("groups", row,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static void deleteGroups(int id) async {
    final database = await Timetable_DB.getDatabase();
    await database.rawDelete(
      "DELETE FROM groups WHERE group_id = ? ",[id]);
  }
}