import 'package:get/get.dart';

class SwitchesController extends GetxController {
  late List<Map<String, dynamic>> mutableList;

  //Sort ipv4 addresses
  List<String> sortIPv4Addresses(List<String> ipAddresses) {
    List<int> numericalAddresses = [];

    // Convert IP addresses to numerical representations
    for (String ip in ipAddresses) {
      List<int> octets = ip.split('.').map(int.parse).toList();
      int numericalAddress =
          octets[0] << 24 | octets[1] << 16 | octets[2] << 8 | octets[3];
      numericalAddresses.add(numericalAddress);
    }

    // Sort the numerical representations
    numericalAddresses.sort();

    // Convert back to IP addresses
    return numericalAddresses.map((numericalAddress) {
      int a = (numericalAddress >> 24) & 0xFF;
      int b = (numericalAddress >> 16) & 0xFF;
      int c = (numericalAddress >> 8) & 0xFF;
      int d = numericalAddress & 0xFF;
      return "$a.$b.$c.$d";
    }).toList();
  }

  List<String> orderedList = [];

  void updateList(List<Map<String, dynamic>> newList) {
    //create a mutable copy of proprios
    mutableList = List<Map<String, dynamic>>.from(newList);

    //initial list of ips
    List<String> rd = [];

    //traverse List<Map<String, dynamic>> proprios
    for (var proprio in mutableList) {
      String ip = proprio['ipgerenciaswitch'];
      if (ip.isNotEmpty) {
        List<String> newip = ip.split('/');
        rd = rd + newip;
      }
    }

    orderedList = sortIPv4Addresses(rd);
  }
}
