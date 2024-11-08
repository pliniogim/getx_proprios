import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/detail/detail_page.dart';
import 'package:proprios/onus/controller/onus_controller.dart';

class CustomInkwell extends StatelessWidget {
  const CustomInkwell({
    super.key,
    required this.unidades,
    required this.index,
    required this.scontroller,
  });

  final List<Map<String, dynamic>> unidades;
  final int index;
  final OnusController scontroller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final matchingIndex = unidades.indexWhere(
          (item) =>
              item['ipgerenciaonu'].contains(scontroller.orderedList[index]),
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
  }
}
