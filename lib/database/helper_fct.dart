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
      rooms.room_capacity, 
      rooms.room_availability
      FROM rooms
    ''');
  }
  static Future insertRoom(Map<String, dynamic> row,) async {
    final database = await Timetable_DB.getDatabase();
    database.insert("rooms", row,
        conflictAlgorithm: ConflictAlgorithm.replace);
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

  static void deleteWorkingDay(String id_day, String id_teacher) async {
    final database = await Timetable_DB.getDatabase();
    await database.rawDelete(
      "DELETE FROM working_days WHERE week_day = ? AND teacher_id = ?",[id_day, id_teacher]);
  }
}


// GROUPS TEACHES
class GroupsTeachersData {
  static Future<List<Map<String, dynamic>>> getAllGroupsTeachers() async {
    final database = await Timetable_DB.getDatabase();
    return database.rawQuery('''SELECT 
      groups_teachers.group_id,
      groups_teachers.teacher_id
      FROM groups_teachers
    ''');
  }
  
  static Future insertGroupsTeachers(Map<String, dynamic> row) async {
    final database = await Timetable_DB.getDatabase();
    
    // Check if the record already exists
    final List<Map<String, dynamic>> existingRecords = await database.rawQuery(
      "SELECT * FROM groups_teachers WHERE group_id = ? AND teacher_id = ?",
      [row['group_id'], row['teacher_id']]
    );
    
    if (existingRecords.isNotEmpty) {
      print('Row already exists');
      return; // Exit the method if the record already exists
    }

    // Insert the record if it doesn't exist
    await database.insert(
      "groups_teachers",
      row,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static void deleteGroupsTeachers(String id_teacher) async {
    final database = await Timetable_DB.getDatabase();
    await database.rawDelete(
      "DELETE FROM groups_teachers WHERE teacher_id = ?",
      [id_teacher],
    );
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
      teachers.teacher_availability,
      teachers.field,
      teachers.priority, 
      teachers.pereferred_period
      FROM teachers
    ''');
  }
  static Future insertTeacher(Map<String, dynamic> row,) async {
    final database = await Timetable_DB.getDatabase();
    database.insert("teachers", row,
        conflictAlgorithm: ConflictAlgorithm.replace);
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
    print(row);
    try {
        final database = await Timetable_DB.getDatabase();
        database.insert("subjects", row, conflictAlgorithm: ConflictAlgorithm.replace);
    } catch(e) {
        print('###${e}');
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
  static Future insertGroup(Map<String, dynamic> row,) async {
    final database = await Timetable_DB.getDatabase();
    database.insert("groups", row,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static void deleteGroups(String id) async {
    final database = await Timetable_DB.getDatabase();
    await database.rawDelete(
      "DELETE FROM groups WHERE group_id = ? ",[id]);
  }
}


//SESSIONS
class SessionsData {
  static Future<List<Map<String, dynamic>>> getSessions() async {
    final database = await Timetable_DB.getDatabase();
    return database.rawQuery('''SELECT 
      sessions.session_id,
      sessions.subject_id,
      sessions.session_type,
      sessions.nb_of_sessions_per_week
      FROM sessions
    ''');
  }
static Future insertSession(Map<String, dynamic> row,) async {
    print(row);
    try {
        final database = await Timetable_DB.getDatabase();
        database.insert("sessions", row, conflictAlgorithm: ConflictAlgorithm.replace);
    } catch(e) {
        print('###${e}');
    }
}


  static void deleteSession(String id) async {
    final database = await Timetable_DB.getDatabase();
    await database.rawDelete(
      "DELETE FROM sessions WHERE session_id = ? ",[id]);
  }
}
