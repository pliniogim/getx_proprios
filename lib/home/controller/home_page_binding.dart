import 'package:get/get.dart';
import 'package:proprios/home/controller/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController(), permanent: true);
  }
}
