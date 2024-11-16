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
    required this.scontroller,
  });

  final List<Map<String, dynamic>> unidades;
  // for index matching the value on onTap
  final int index;
  // ip ordered list controller
  final IpGenericController scontroller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // goes to detail page if onTap
      // finding the correspondent item (index)
      onTap: () {
        final matchingIndex = unidades.indexWhere(
          (item) =>
              item['ipgerenciaonu'].contains(scontroller.orderedList[index]),
        );
        // land page -> detail page
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
            // sorted onu ip
            scontroller.orderedList[index],
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
