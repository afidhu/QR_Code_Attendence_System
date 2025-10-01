class Attendances {
  int? attendenceId;
  int? sessionId;
  String? studentReg;
  String? studentSign;
  String? deviceId;
  String? createdAt;
  String? status;
  String? deviceName;
  String? studentName;
  String? courseName;
  String? startTime;
  String? endTime;
  String? day;
  String? staffName;
  int? classYear;
  int? programId;
  String? classLevel;

  Attendances({
    this.attendenceId,
    this.sessionId,
    this.studentReg,
    this.studentSign,
    this.deviceId,
    this.createdAt,
    this.status,
    this.deviceName,
    this.studentName,
    this.courseName,
    this.startTime,
    this.endTime,
    this.day,
    this.staffName,
    this.classYear,
    this.programId,
    this.classLevel,
  });

  Attendances.fromJson(Map<String, dynamic> json) {
    attendenceId = json['attendence_id'];
    sessionId = json['session_id'];
    studentReg = json['student_reg'];
    studentSign = json['student_sign'];
    deviceId = json['device_id'];
    createdAt = json['created_at'];
    status = json['status'];
    deviceName = json['device_name'];
    studentName = json['student_name'];
    courseName = json['course_name'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    day = json['day'];
    staffName = json['staff_name'];
    classYear = json['class_year'];
    programId = json['program_id'];
    classLevel = json['class_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['attendence_id'] = attendenceId;
    data['session_id'] = sessionId;
    data['student_reg'] = studentReg;
    data['student_sign'] = studentSign;
    data['device_id'] = deviceId;
    data['created_at'] = createdAt;
    data['status'] = status;
    data['device_name'] = deviceName;
    data['student_name'] = studentName;
    data['course_name'] = courseName;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['day'] = day;
    data['staff_name'] = staffName;
    data['class_year'] = classYear;
    data['program_id'] = programId;
    data['class_level'] = classLevel;
    return data;
  }
}
