import 'package:get/get.dart';

class IpController extends GetxController {
  // It is mandatory initialize with one value from listType
  var selected = "".obs;

  late List<String> mutableList;

  void ipSelection(List<String> ipAddresses) {
    selected.value = ipAddresses[0];
    mutableList = List<String>.from(ipAddresses);
  }

  void setSelected(String value) {
    selected.value = value;
  }
}
