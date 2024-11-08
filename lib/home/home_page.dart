import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/detail/detail_page.dart';
import 'package:proprios/home/widgets/custom_appbar.dart';
import 'package:proprios/home/widgets/custom_drawer.dart';
import 'package:proprios/search/search_page.dart';
import 'package:proprios/vlan/vlan_page.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController(), permanent: true);
  }
}

class HomePageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}

class HomePage extends GetView<HomePageController> {
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
          return InkWell(
            onTap: () {
              Get.to(
                DetailPage(
                  index: index,
                  unidades: unidades,
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 10.0,
              ),
              color: Colors.greenAccent,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Text(
                            unidades[index]['unidade'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13.0),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Text(
                            unidades[index]['descricao'],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.lightGreenAccent,
      //   tooltip: 'Search...',
      //   onPressed: () async {
      //     await Future.delayed(const Duration(milliseconds: 500));
      //     Get.to(
      //       () => SearchPage(
      //         unidades: unidades,
      //       ),
      //     );
      //     // Get.to(SearchPage());
      //   },
      //   child: Icon(
      //     Icons.search,
      //     color: Colors.green,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
