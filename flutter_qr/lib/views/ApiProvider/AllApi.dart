class ApiUrls {
  // Base URL
  static const String baseUrl = 'http://172.16.85.249:5000';
  // static const String baseUrl = 'http://http://10.0.2.2:5000'; //THIS IS EMULATOR default API


  // Endpoints
  static const String auth = '$baseUrl/auth/login';

  static const String timetable ='$baseUrl/timetable';
  static const String timetableByCr ='$baseUrl/timetable/filter';
  static const String sessions ='$baseUrl/session';
  static const String assignAttendance ='$baseUrl/session/studentconfirmsession';
  static const String student = '$baseUrl/student';
  static const String studentattendences = '$baseUrl/studentattendence';
  static const String table_session ='$baseUrl/table-session';

  static const String attendences ='$baseUrl/attendence';
  static const String course_attendence ='$attendences/course';

}
