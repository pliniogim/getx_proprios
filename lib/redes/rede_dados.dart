// import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/controller/ip_generic_controller.dart';
import 'package:proprios/home/widgets/custom_appbar.dart';
import 'package:proprios/home/widgets/custom_drawer.dart';
import 'package:proprios/redes/widgets/custom_inkwell.dart';
import 'package:proprios/search/search_page.dart';

class RedeDados extends StatelessWidget {
  final List<Map<String, dynamic>> unidades;

  const RedeDados({
    super.key,
    required this.unidades,
  });

  @override
  Widget build(BuildContext context) {
    //initialize ahead of use (on search)
    // ignore: unused_local_variable
    final MyController mycontroller = Get.put(MyController());

    // controller for sorting ips
    final rcontroller = Get.put(IpGenericController());

    // pass list of proprios and what to order
    rcontroller.updateList(unidades, "redes");

    return Scaffold(
      drawer: CustomDrawer(unidades: unidades),
      appBar: customAppBar(unidades),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 6 / 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2),
        itemCount: rcontroller.orderedList.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomInkwell(
              unidades: unidades, index: index, rcontroller: rcontroller);
        },
      ),
    );
  }
}
