import 'package:sqflite/sqflite.dart';
import 'database.dart';

//ROOMS
class RoomsData {
  static Future<List<Map<String, dynamic>>> getAllRooms() async {
    final database = await Timetable_DB.getDatabase();
    return database.rawQuery('''SELECT 
      rooms.room_id,
      rooms.room_type,
      rooms.session_type,          
      rooms.room_capacity
      FROM rooms
    ''');
  }
  static Future insertRoom(Map<String, dynamic> row,) async {
    final database = await Timetable_DB.getDatabase();
    List<Map<String, dynamic>> result = await database.rawQuery(
        "SELECT * FROM rooms WHERE room_id = ?", [row['room_id']]);
    if (result.isEmpty) {
        await database.insert("rooms", row, conflictAlgorithm: ConflictAlgorithm.replace);
      } else {
        throw Exception("Rooms with ID ${row['room_id']} already exists!");
      }
  }

  static void deleteRoom(String id) async {
    final database = await Timetable_DB.getDatabase();
    database.rawQuery(
        """delete from rooms where room_id=?""", [id]);
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
    database.insert("working_days", row,
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
    List<Map<String, dynamic>> result = await database.rawQuery(
        "SELECT * FROM teachers WHERE teacher_id = ?", [row['teacher_id']]);
    if (result.isEmpty) {
        await database.insert("teachers", row, conflictAlgorithm: ConflictAlgorithm.replace);
      } else {
        throw Exception("Teacher with ID ${row['teacher_id']} already exists!");
      }
  }

  static void deleteTeacher(String id) async {
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
    final database = await Timetable_DB.getDatabase();
    List<Map<String, dynamic>> result = await database.rawQuery(
        "SELECT * FROM subjects WHERE subject_id = ?", [row['subject_id']]);
    if (result.isEmpty) {
        await database.insert("subjects", row, conflictAlgorithm: ConflictAlgorithm.replace);
      } else {
        throw Exception("Subject with ID ${row['subject_id']} already exists!");
      }
  }

  static void deleteSubject(String id) async {
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

  static Future<void> insertGroup(Map<String, dynamic> row,) async {
    final database = await Timetable_DB.getDatabase();
    List<Map<String, dynamic>> result = await database.rawQuery(
      "SELECT * FROM groups WHERE group_id = ?", [row['group_id']]);
    if (result.isEmpty) {
      await database.insert("groups", row, conflictAlgorithm: ConflictAlgorithm.replace);
    } else {
      throw Exception("Group with ID ${row['group_id']} already exists!");
    }
  }

  static void deleteGroups(String id) async {
    final database = await Timetable_DB.getDatabase();
    await database.rawDelete(
      "DELETE FROM groups WHERE group_id = ? ",[id]);
  }
}