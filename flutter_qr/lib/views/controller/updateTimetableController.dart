
import 'package:flutter_qr/views/ApiProvider/AllApi.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UpdateTimetableController extends GetxController {

  var isUpdated= false.obs;

  Future<void> updateTimetable(int timetableId) async {
    try {
      print('object');
      final url = Uri.parse('${ApiUrls.table_session}/$timetableId');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        isUpdated.value =true;
        print('data are ${response.body}');
      } else {
        isUpdated.value =false;
        print('fail to get data erorr at ${response.body}');
      }
    } catch (e) {
      isUpdated.value =false;
      throw Exception('error at : ${e.toString()}');
    }
  }
}
