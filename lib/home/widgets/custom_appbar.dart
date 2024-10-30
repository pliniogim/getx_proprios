import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: IconButton(
          icon: const Icon(Icons.alt_route),
          tooltip: 'Vlan list page',
          onPressed: () async {
            await Future.delayed(const Duration(milliseconds: 500));
            Get.to(
              VlanPage(
                unidades: unidades,
              ),
            );
          },
        ),
      ),
    ],
  );
}
