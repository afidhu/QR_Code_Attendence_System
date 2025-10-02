class StudentAttendences {
  int? attendenceId;
  int? sessionId;
  String? studentReg;
  String? studentSign;
  String? deviceId;
  String? createdAt;
  String? status;
  String? deviceName;
  int? timetableId;
  int? expiredTime;
  String? createdTime;
  int? courseId;
  String? day;
  String? date;
  String? startTime;
  String? endTime;
  int? lectureId;
  bool? isSessioned;
  int? classYear;
  int? programId;
  String? classLevel;
  String? courseName;
  String? staffName;

  StudentAttendences(
      {this.attendenceId,
        this.sessionId,
        this.studentReg,
        this.studentSign,
        this.deviceId,
        this.createdAt,
        this.status,
        this.deviceName,
        this.timetableId,
        this.expiredTime,
        this.createdTime,
        this.courseId,
        this.day,
        this.date,
        this.startTime,
        this.endTime,
        this.lectureId,
        this.isSessioned,
        this.classYear,
        this.programId,
        this.classLevel,
        this.courseName,
        this.staffName});

  StudentAttendences.fromJson(Map<String, dynamic> json) {
    attendenceId = json['attendence_id'];
    sessionId = json['session_id'];
    studentReg = json['student_reg'];
    studentSign = json['student_sign'];
    deviceId = json['device_id'];
    createdAt = json['created_at'];
    status = json['status'];
    deviceName = json['device_name'];
    timetableId = json['timetable_id'];
    expiredTime = json['expired_time'];
    createdTime = json['created_time'];
    courseId = json['course_id'];
    day = json['day'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    lectureId = json['lecture_id'];
    isSessioned = json['is_sessioned'];
    classYear = json['class_year'];
    programId = json['program_id'];
    classLevel = json['class_level'];
    courseName = json['course_name'];
    staffName = json['staff_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attendence_id'] = this.attendenceId;
    data['session_id'] = this.sessionId;
    data['student_reg'] = this.studentReg;
    data['student_sign'] = this.studentSign;
    data['device_id'] = this.deviceId;
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    data['device_name'] = this.deviceName;
    data['timetable_id'] = this.timetableId;
    data['expired_time'] = this.expiredTime;
    data['created_time'] = this.createdTime;
    data['course_id'] = this.courseId;
    data['day'] = this.day;
    data['date'] = this.date;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['lecture_id'] = this.lectureId;
    data['is_sessioned'] = this.isSessioned;
    data['class_year'] = this.classYear;
    data['program_id'] = this.programId;
    data['class_level'] = this.classLevel;
    data['course_name'] = this.courseName;
    data['staff_name'] = this.staffName;
    return data;
  }
}
