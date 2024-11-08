import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proprios/home/widgets/custom_appbar.dart';
import 'package:proprios/home/widgets/custom_drawer.dart';
import 'package:proprios/search/search_page.dart';
import 'package:proprios/vlan/controller/vlan_controller.dart';
import 'package:proprios/vlan/widgets/custom_padding.dart';

class VlanPage extends StatelessWidget {
  final List<Map<String, dynamic>> unidades;

  const VlanPage({
    super.key,
    required this.unidades,
  });

  @override
  Widget build(BuildContext context) {
    //initialize ahead of use (on search)
    // ignore: unused_local_variable
    final MyController mycontroller = Get.put(MyController());
    final vcontroller = Get.put(VlanController());

    vcontroller.updateList(unidades);

    return Scaffold(
      drawer: CustomDrawer(unidades: unidades),
      appBar: customAppBar(unidades),
      body: ListView.builder(
        itemCount: vcontroller.mutableList.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomPadding(
              unidades: unidades, index: index, vcontroller: vcontroller);
        },
      ),
    );
  }
}
