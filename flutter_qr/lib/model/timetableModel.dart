class TimetablePerCr {
  int? timetableId;
  int? courseId;
  String? day;
  String? date;
  String? startTime;
  String? endTime;
  int? lectureId;
  String? createdAt;
  bool? isSessioned;
  int? classYear;
  int? programId;
  String? classLevel;
  String? programName;
  String? courseName;
  String? staffName;
  String? courseCode;

  TimetablePerCr(
      {this.timetableId,
        this.courseId,
        this.day,
        this.date,
        this.startTime,
        this.endTime,
        this.lectureId,
        this.createdAt,
        this.isSessioned,
        this.classYear,
        this.programId,
        this.classLevel,
        this.programName,
        this.courseName,
        this.staffName,
        this.courseCode});

  TimetablePerCr.fromJson(Map<String, dynamic> json) {
    timetableId = json['timetable_id'];
    courseId = json['course_id'];
    day = json['day'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    lectureId = json['lecture_id'];
    createdAt = json['created_at'];
    isSessioned = json['is_sessioned'];
    classYear = json['class_year'];
    programId = json['program_id'];
    classLevel = json['class_level'];
    programName = json['program_name'];
    courseName = json['course_name'];
    staffName = json['staff_name'];
    courseCode = json['course_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timetable_id'] = timetableId;
    data['course_id'] = courseId;
    data['day'] = day;
    data['date'] = date;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['lecture_id'] = lectureId;
    data['created_at'] = createdAt;
    data['is_sessioned'] = isSessioned;
    data['class_year'] = classYear;
    data['program_id'] = programId;
    data['class_level'] = classLevel;
    data['program_name'] = programName;
    data['course_name'] = courseName;
    data['staff_name'] = staffName;
    data['course_code'] = courseCode;
    return data;
  }
}
