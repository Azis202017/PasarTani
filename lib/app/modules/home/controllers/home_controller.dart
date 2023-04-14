import 'package:get/get.dart';

class HomeController extends GetxController {
 DateTime dateTime = DateTime.now();
  String  _title = "";
  String get title => _title;
  void checkTime() {
    if(dateTime.hour < 12) {
      _title = "Pagi";
    }else if(dateTime.hour < 17) {
      _title = "Siang";
    }else {
      _title = "Malam";
    }
    update();
  }
 
}
