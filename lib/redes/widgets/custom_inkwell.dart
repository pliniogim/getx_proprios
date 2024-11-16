// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/controller/ip_generic_controller.dart';
import 'package:proprios/detail/detail_page.dart';
import 'package:proprios/utils/constants/constants.dart';

class CustomInkwell extends StatelessWidget {
  const CustomInkwell({
    super.key,
    required this.unidades,
    required this.index,
    required this.rcontroller,
  });

  final List<Map<String, dynamic>> unidades;
  final int index;
  final IpGenericController rcontroller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final matchingIndex = unidades.indexWhere(
          (item) => item['rededados'].contains(rcontroller.orderedList[index]),
        );
        Get.to(
          DetailPage(
            index: matchingIndex,
            unidades: unidades,
          ),
        );
      },
      child: Container(
        color: kSecondaryColor,
        child: Center(
          child: Text(
            rcontroller.orderedList[index],
            style: TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
