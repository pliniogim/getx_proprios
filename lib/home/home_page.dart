import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/home/controller/home_page_controller.dart';
import 'package:proprios/home/widgets/custom_appbar.dart';
import 'package:proprios/home/widgets/custom_drawer.dart';
import 'package:proprios/home/widgets/custom_inkwell.dart';
import 'package:proprios/search/search_page.dart';
import 'package:proprios/vlan/controller/vlan_controller.dart';

class HomePage extends GetView<HomePageController> {
  //initialize MyController/vcontroller ahead of use
  final MyController mycontroller = Get.put(MyController());
  final vcontroller = Get.put(VlanController());

  final List<Map<String, dynamic>> unidades;
  HomePage({required this.unidades, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(unidades: unidades),
      appBar: customAppBar(unidades),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 70,
          left: 5.0,
          right: 5.0,
        ),
        child: ListView.builder(
          itemCount: unidades.length,
          itemBuilder: (BuildContext context, int index) {
            return HomePageInkwell(unidades: unidades, index: index);
          },
        ),
      ),
    );
  }
}
