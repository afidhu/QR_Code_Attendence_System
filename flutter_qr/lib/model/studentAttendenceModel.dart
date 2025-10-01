class StudentAttendences {
  int? attendenceId;
  int? sessionId;
  String? studentReg;
  String? studentSign;
  String? deviceId;
  String? createdAt;
  String? status;
  String? deviceName;

  StudentAttendences(
      {this.attendenceId,
        this.sessionId,
        this.studentReg,
        this.studentSign,
        this.deviceId,
        this.createdAt,
        this.status,
        this.deviceName});

  StudentAttendences.fromJson(Map<String, dynamic> json) {
    attendenceId = json['attendence_id'];
    sessionId = json['session_id'];
    studentReg = json['student_reg'];
    studentSign = json['student_sign'];
    deviceId = json['device_id'];
    createdAt = json['created_at'];
    status = json['status'];
    deviceName = json['device_name'];
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
    return data;
  }
}
