import 'package:get/get.dart';
import 'package:proprios/controller/ip_generic_controller.dart';

class SwitchesPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IpGenericController(), permanent: true);
  }
}
