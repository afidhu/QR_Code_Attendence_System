class AttendancePerCourse {
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

  AttendancePerCourse(
      {this.attendenceId,
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
        this.staffName});

  AttendancePerCourse.fromJson(Map<String, dynamic> json) {
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
    data['student_name'] = this.studentName;
    data['course_name'] = this.courseName;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['day'] = this.day;
    data['staff_name'] = this.staffName;
    return data;
  }
}
