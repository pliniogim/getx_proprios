import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/home/detail/detail_page.dart';
import 'package:proprios/vlan/controller/vlan_controller.dart';

class CustomPadding extends StatelessWidget {
  const CustomPadding({
    super.key,
    required this.unidades,
    required this.index,
    required this.vcontroller,
  });

  final List<Map<String, dynamic>> unidades;
  final int index;
  final VlanController vcontroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          final matchingIndex = unidades.indexWhere((item) =>
              item['descricao'] == vcontroller.mutableList[index]['descricao']);
          Get.to(
            DetailPage(
              index: matchingIndex,
              unidades: unidades,
            ),
          );
        },
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
  }
}
