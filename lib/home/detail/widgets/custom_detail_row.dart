import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/home/detail/controller/ip_controller.dart';

class CustomDetailRow extends StatelessWidget {
  const CustomDetailRow({
    super.key,
    required this.unidades,
    required this.index,
    required this.ipcontroller,
  });

  final List<Map<String, dynamic>> unidades;
  final int index;
  final IpController ipcontroller;

  @override
  Widget build(BuildContext context) {
    return showBottomRows();
  }

  Row showBottomRows() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Switch"),
        IconButton(
          onPressed: () {
            String unit = unidades[index]["ipgerenciaswitch"];
            selectHardw(unit, "s");
          },
          icon: Icon(Icons.outbond),
          tooltip: "ssh",
        ),
        IconButton(
          onPressed: () {
            var unit = unidades[index]["ipgerenciaswitch"];
            selectHardw(unit, "o");
          },
          icon: Icon(Icons.swap_horiz),
          tooltip: "ping",
        ),
        SizedBox(
          width: 30.0,
        ),
        Divider(
          thickness: 2.0,
        ),
        Text("Onu"),
        IconButton(
          onPressed: () {
            String unit = unidades[index]["ipgerenciaonu"];
            selectHardw(unit, "s");
          },
          icon: Icon(Icons.outbond),
          tooltip: "ssh",
          color: Colors.purple,
        ),
        IconButton(
          onPressed: () {
            var unit = unidades[index]['ipgerenciaonu'];
            selectHardw(unit, "o");
          },
          icon: Icon(Icons.swap_horiz),
          tooltip: "ping",
          color: Colors.purple,
        ),
        SizedBox(
          width: 30,
        ),
        Text("Rede"),
        IconButton(
          onPressed: () {
            var unit = unidades[index]["rededados"];
            Process.run('cmd', [
              '/c',
              'start c:\\ais\\advanced_ip_scanner_console.exe',
              '/r:$unit'
            ]);
            unit = '';
          },
          icon: Icon(Icons.computer),
          tooltip: "Rede",
          color: Colors.purple,
        ),
      ],
    );
  }

  void selectHardw(String unit, String cmd) {
    List<String> hardware = [];
    if (unit.contains("/")) {
      hardware = unit.split("/");
      ipcontroller.ipSelection(hardware);
      Get.dialog(
        AlertDialog(
          title: const Text(
            'Alert',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          content: const Text(
              'More than one hardware detected.\nSelect one from the list.'),
          actions: [
            Obx(
              () => DropdownButton(
                hint: Text(
                  'Access ip',
                ),
                onChanged: (newValue) {
                  ipcontroller.setSelected(newValue!);
                },
                value: ipcontroller.selected.value == ""
                    ? null
                    : ipcontroller.selected.value,
                items: ipcontroller.mutableList.map((selectedType) {
                  return DropdownMenuItem(
                    value: selectedType,
                    child: Text(
                      selectedType,
                    ),
                  );
                }).toList(),
              ),
            ),
            TextButton(
              child: const Text("Connect"),
              onPressed: () {
                if (cmd == "s") {
                  Process.run('putty.exe', [
                    '-ssh',
                    ipcontroller.selected.value,
                  ]);
                  unit = '';
                } else {
                  Process.run('cmd', [
                    '/c',
                    'start ping ${ipcontroller.selected.value}',
                  ]);
                }
                Get.back();
                unit = '';
              },
            ),
          ],
        ),
      );
    } else {
      if (cmd == "s") {
        Process.run('putty.exe', [
          '-ssh',
          unit,
        ]);
        unit = '';
      } else {
        Process.run('cmd', [
          '/c',
          'start ping $unit',
        ]);
      }
      unit = '';
    }
  }
}
