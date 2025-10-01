class ApiUrls {
  // Base URL
  static const String baseUrl = 'http://192.168.1.133:5000';

  // Endpoints
  static const String auth = '$baseUrl/auth/login';

  static const String timetable ='$baseUrl/timetable';
  static const String timetableByCr ='$baseUrl/timetable/filter';
  static const String sessionCreate ='$baseUrl/session';
  static const String assignAttendance ='$baseUrl/session/studentconfirmsession';
  static const String student = '$baseUrl/student';
}
