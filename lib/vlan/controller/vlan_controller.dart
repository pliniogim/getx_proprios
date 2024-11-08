import 'package:get/get.dart';

class VlanController extends GetxController {
  late List<Map<String, dynamic>> mutableList;

  void updateList(List<Map<String, dynamic>> newList) {
    mutableList = List<Map<String, dynamic>>.from(newList);

    mutableList.sort((a, b) {
      return a['vlandados'].compareTo(b['vlandados']);
    });
  }
}
