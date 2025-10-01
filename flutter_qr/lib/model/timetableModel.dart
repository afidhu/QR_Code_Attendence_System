class TimetablePerCr {
  int? timetableId;
  String? day;
  String? date;
  String? startTime;
  String? endTime;
  int? classYear;
  String? classLevel;
  int? programId;
  String? programName;
  bool? isSessioned;

  TimetablePerCr(
      {this.timetableId,
        this.day,
        this.date,
        this.startTime,
        this.endTime,
        this.classYear,
        this.classLevel,
        this.programId,
        this.programName,
        this.isSessioned,
      });

  TimetablePerCr.fromJson(Map<String, dynamic> json) {
    timetableId = json['timetable_id'];
    day = json['day'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    classYear = json['class_year'];
    classLevel = json['class_level'];
    programId = json['program_id'];
    programName = json['program_name'];
    isSessioned = json['is_sessioned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timetable_id'] = this.timetableId;
    data['day'] = this.day;
    data['date'] = this.date;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['class_year'] = this.classYear;
    data['class_level'] = this.classLevel;
    data['program_id'] = this.programId;
    data['program_name'] = this.programName;
    data['is_sessioned'] = this.isSessioned;
    return data;
  }
}



///////
//
//
// class TimetablePerCr {
//   int timetableId;
//   int courseId;
//   String day;
//   String date;
//   String startTime;
//   String endTime;
//   int lectureId;
//   String createdAt;
//   bool isSessioned;
//   int classYear;
//   int programId;
//   Null classLevel;
//
//   TimetablePerCr(
//       {this.timetableId,
//         this.courseId,
//         this.day,
//         this.date,
//         this.startTime,
//         this.endTime,
//         this.lectureId,
//         this.createdAt,
//         this.isSessioned,
//         this.classYear,
//         this.programId,
//         this.classLevel});
//
//   TimetablePerCr.fromJson(Map<String, dynamic> json) {
//     timetableId = json['timetable_id'];
//     courseId = json['course_id'];
//     day = json['day'];
//     date = json['date'];
//     startTime = json['start_time'];
//     endTime = json['end_time'];
//     lectureId = json['lecture_id'];
//     createdAt = json['created_at'];
//     isSessioned = json['is_sessioned'];
//     classYear = json['class_year'];
//     programId = json['program_id'];
//     classLevel = json['class_level'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['timetable_id'] = this.timetableId;
//     data['course_id'] = this.courseId;
//     data['day'] = this.day;
//     data['date'] = this.date;
//     data['start_time'] = this.startTime;
//     data['end_time'] = this.endTime;
//     data['lecture_id'] = this.lectureId;
//     data['created_at'] = this.createdAt;
//     data['is_sessioned'] = this.isSessioned;
//     data['class_year'] = this.classYear;
//     data['program_id'] = this.programId;
//     data['class_level'] = this.classLevel;
//     return data;
//   }
// }
