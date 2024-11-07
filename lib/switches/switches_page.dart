import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/detail/detail_page.dart';
import 'package:proprios/home/widgets/custom_appbar.dart';
import 'package:proprios/home/widgets/custom_drawer.dart';
import 'package:proprios/search/search_page.dart';

class SwitchesPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SwitchesPageController(), permanent: true);
  }
}

class SwitchesPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}

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

class SwitchesPage extends GetView<SwitchesPageController> {
  final List<Map<String, dynamic>> unidades;
  const SwitchesPage({
    super.key,
    required this.unidades,
  });

  @override
  Widget build(BuildContext context) {
    final MyController mycontroller = Get.put(MyController());
    final scontroller = Get.put(SwitchesController());
    scontroller.updateList(unidades);
    return Scaffold(
      drawer: CustomDrawer(unidades: unidades),
      appBar: customAppBar(unidades),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 6 / 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2),
        itemCount: scontroller.orderedList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              final matchingIndex = unidades.indexWhere(
                (item) => item['ipgerenciaswitch']
                    .contains(scontroller.orderedList[index]),
              );
              Get.to(
                DetailPage(
                  index: matchingIndex,
                  unidades: unidades,
                ),
              );
            },
            child: Container(
              color: Colors.greenAccent,
              child: Center(
                // tileColor: Colors.greenAccent,
                child: Text(
                  scontroller.orderedList[index],
                  style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
