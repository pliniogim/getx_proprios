import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proprios/controller/ip_generic_controller.dart';
import 'package:proprios/home/widgets/custom_appbar.dart';
import 'package:proprios/home/widgets/custom_drawer.dart';
import 'package:proprios/onus/controller/onus_page_controller.dart';
import 'package:proprios/onus/widgets/custom_inkwell.dart';
import 'package:proprios/search/search_page.dart';

class OnusPage extends GetView<OnusPageController> {
  final List<Map<String, dynamic>> unidades;
  const OnusPage({
    super.key,
    required this.unidades,
  });

  @override
  Widget build(BuildContext context) {
    //initialize ahead of time (use of search in appBar)
    // ignore: unused_local_variable
    final MyController mycontroller = Get.put(MyController());

    // generic ip sort function
    final scontroller = Get.put(IpGenericController());

    // pass list of proprios and what to order
    scontroller.updateList(unidades, "onu");
    return Scaffold(
      // lateral drawer
      drawer: CustomDrawer(unidades: unidades),
      // common appBar
      appBar: customAppBar(unidades),

      // gridview builder
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 6 / 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2),
        itemCount: scontroller.orderedList.length,
        itemBuilder: (BuildContext context, int index) {
          // inkwell for onTap control
          return CustomInkwell(
            unidades: unidades,
            index: index,
            scontroller: scontroller,
          );
        },
      ),
    );
  }
}
