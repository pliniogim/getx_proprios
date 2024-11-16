import 'package:get/get.dart';

class IpGenericController extends GetxController {
  // list of proprios that will be passed to
  late List<Map<String, dynamic>> mutableList;

  //regex expression for ip validation
  final ipv4Regex = RegExp(
      r'^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])$');

  //Sort function for ipv4 addresses
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

  // check ip is valid with regex
  bool isValidIPv4(String ipAddress) {
    return ipv4Regex.hasMatch(ipAddress);
  }

  // final ordered list of ips
  List<String> orderedList = [];

  void updateList(List<Map<String, dynamic>> newList, String whattoorder) {
    //create a mutable copy of proprios
    mutableList = List<Map<String, dynamic>>.from(newList);

    //initial list of ips
    List<String> rd = [];

    //traverse List<Map<String, dynamic>> proprios
    for (var proprio in mutableList) {
      String ip = "";
      if (whattoorder == "onu") {
        ip = proprio['ipgerenciaonu'];
      }
      if (whattoorder == "redes") {
        ip = proprio['rededados'];
      }
      if (whattoorder == "switch") {
        ip = proprio['ipgerenciaswitch'];
      }
      // if there is a / in String
      // split String to get all ip in there
      List<String> newip = ip.split('/');
      for (var x in newip) {
        if (isValidIPv4(x)) {
          rd.add(x);
        }
      }
    }

    // sort list
    orderedList = sortIPv4Addresses(rd);
  }
}
