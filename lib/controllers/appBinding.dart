import 'package:alpha/controllers/allSongs_controller.dart';
import 'package:get/instance_manager.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AllSongs());
  }
}
