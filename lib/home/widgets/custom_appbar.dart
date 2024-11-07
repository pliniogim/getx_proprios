import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/onus/onus_page.dart';
import 'package:proprios/redes/rede_dados.dart';
import 'package:proprios/switches/switches_page.dart';
import 'package:proprios/vlan/vlan_page.dart';

customAppBar(List<Map<String, dynamic>> unidades) {
  return AppBar(
    elevation: 10.0,
    shadowColor: Colors.grey,
    title: Text(
      'PRÓPRIOS - PMSCS (${unidades.length})',
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(255, 103, 231, 1),
      ),
    ),
    // actions: <Widget>[
    //   Padding(
    //     padding: const EdgeInsets.only(right: 12.0),
    //     child: IconButton(
    //       icon: const Icon(Icons.alt_route),
    //       tooltip: 'Vlan list page',
    //       onPressed: () async {
    //         await Future.delayed(const Duration(milliseconds: 500));
    //         Get.to(
    //           () => VlanPage(
    //             unidades: unidades,
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    //   Padding(
    //     padding: const EdgeInsets.only(right: 12.0),
    //     child: IconButton(
    //       icon: const Icon(Icons.compare_arrows_rounded),
    //       tooltip: 'Data network list page',
    //       onPressed: () async {
    //         await Future.delayed(const Duration(milliseconds: 500));
    //         Get.to(
    //           () => RedeDados(
    //             unidades: unidades,
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    //   Padding(
    //     padding: const EdgeInsets.only(right: 12.0),
    //     child: IconButton(
    //       icon: const Icon(Icons.router_outlined),
    //       tooltip: 'Switches list page',
    //       onPressed: () async {
    //         await Future.delayed(const Duration(milliseconds: 500));
    //         Get.to(
    //           () => SwitchesPage(
    //             unidades: unidades,
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    //   Padding(
    //     padding: const EdgeInsets.only(right: 12.0),
    //     child: IconButton(
    //       icon: const Icon(Icons.switch_access_shortcut),
    //       tooltip: 'Onus list page',
    //       onPressed: () async {
    //         await Future.delayed(const Duration(milliseconds: 500));
    //         Get.to(
    //           () => OnusPage(
    //             unidades: unidades,
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // ],
  );
}
