class StudentsAuth {
  int? studentId;
  String? studentName;
  String? studentReg;
  int? courseId;
  String? studentPassword;
  String? studentRole;
  String? year;
  int? programId;
  String? studentLevel;

  StudentsAuth(
      {this.studentId,
        this.studentName,
        this.studentReg,
        this.courseId,
        this.studentPassword,
        this.studentRole,
        this.year,
        this.programId,
        this.studentLevel});

  StudentsAuth.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    studentName = json['student_name'];
    studentReg = json['student_reg'];
    courseId = json['course_id'];
    studentPassword = json['student_password'];
    studentRole = json['student_role'];
    year = json['year'];
    programId = json['program_id'];
    studentLevel = json['student_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['student_name'] = this.studentName;
    data['student_reg'] = this.studentReg;
    data['course_id'] = this.courseId;
    data['student_password'] = this.studentPassword;
    data['student_role'] = this.studentRole;
    data['year'] = this.year;
    data['program_id'] = this.programId;
    data['student_level'] = this.studentLevel;
    return data;
  }
}
