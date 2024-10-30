import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proprios/home/widgets/custom_appbar.dart';

class VlanController extends GetxController {
  late List<Map<String, dynamic>> mutableList;

  void updateList(List<Map<String, dynamic>> newList) {
    mutableList = List<Map<String, dynamic>>.from(newList);

    mutableList.sort((a, b) {
      return a['vlandados'].compareTo(b['vlandados']);
    });
  }
}

class VlanPage extends StatelessWidget {
  final List<Map<String, dynamic>> unidades;

  const VlanPage({
    super.key,
    required this.unidades,
  });

  @override
  Widget build(BuildContext context) {
    final vcontroller = Get.put(VlanController());

    vcontroller.updateList(unidades);

    return Scaffold(
      appBar: customAppBar(unidades),
      body: ListView.builder(
        itemCount: vcontroller.mutableList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.greenAccent,
              title: Text(
                'Vlan: ${vcontroller.mutableList[index]["vlandados"]}',
                style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                vcontroller.mutableList[index]["descricao"],
                style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                  '${vcontroller.mutableList[index]["vlanvoz"]} : ${vcontroller.mutableList[index]["vlanwifiadm"]} : ${vcontroller.mutableList[index]["vlanpedagogica"]}'),
            ),
          );
        },
      ),
    );
  }
}
