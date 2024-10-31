// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/home/widgets/custom_appbar.dart';

class RedeDadosController extends GetxController {
  late List<Map<String, dynamic>> mutableList;

  void updateList(List<Map<String, dynamic>> newList) {
    mutableList = List<Map<String, dynamic>>.from(newList);

    // List rd = (for item in mutableList){

    // }

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

    mutableList.sort((a, b) {
      return a['vlandados'].compareTo(b['vlandados']);
    });
  }
}

class RedeDados extends StatelessWidget {
  final List<Map<String, dynamic>> unidades;

  const RedeDados({
    super.key,
    required this.unidades,
  });

  @override
  Widget build(BuildContext context) {
    final rcontroller = Get.put(RedeDadosController());
    rcontroller.updateList(unidades);

    return Scaffold(
      appBar: customAppBar(unidades),
      body: Center(
        child: Text('Rede de Dados'),
      ),
    );
  }
}
