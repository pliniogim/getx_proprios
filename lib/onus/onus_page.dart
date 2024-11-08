import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/home/widgets/custom_appbar.dart';
import 'package:proprios/home/widgets/custom_drawer.dart';
import 'package:proprios/onus/controller/onus_controller.dart';
import 'package:proprios/onus/widgets/custom_inkwell.dart';
import 'package:proprios/search/search_page.dart';

class OnusPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OnusController(), permanent: true);
  }
}

class OnusPageController extends GetxController {
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

    final scontroller = Get.put(OnusController());
    scontroller.updateList(unidades);
    return Scaffold(
      drawer: CustomDrawer(unidades: unidades),
      appBar: customAppBar(unidades),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 6 / 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2),
        itemCount: scontroller.orderedList.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomInkwell(
              unidades: unidades, index: index, scontroller: scontroller);
        },
      ),
    );
  }
}
