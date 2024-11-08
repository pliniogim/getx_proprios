import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/home/widgets/custom_appbar.dart';
import 'package:proprios/home/widgets/custom_drawer.dart';
import 'package:proprios/home/widgets/custom_inkwell.dart';
import 'package:proprios/search/search_page.dart';
import 'package:proprios/vlan/controller/vlan_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController(), permanent: true);
  }
}

class HomePageController extends GetxController {
  @override
  void onInit() {
    debugPrint('on Init');
    super.onInit();
  }

  @override
  void onReady() {
    debugPrint('on Ready');
    super.onReady();
  }
}

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
      body: ListView.builder(
        itemCount: unidades.length,
        itemBuilder: (BuildContext context, int index) {
          return HomePageInkwell(unidades: unidades, index: index);
        },
      ),
    );
  }
}
