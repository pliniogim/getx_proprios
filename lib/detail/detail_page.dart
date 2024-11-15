import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/detail/controller/ip_controller.dart';
import 'package:proprios/detail/widgets/custom_listview.dart';
import 'package:proprios/home/widgets/custom_appbar.dart';

class DetailPage extends StatelessWidget {
  final int index;
  final List<Map<String, dynamic>> unidades;
  const DetailPage({super.key, required this.index, required this.unidades});

  @override
  Widget build(BuildContext context) {
    IpController ipcontroller = IpController();
    return Scaffold(
      appBar: customAppBar(unidades),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 70,
          bottom: MediaQuery.of(context).size.height / 15,
          left: 5.0,
          right: 5.0,
        ),
        child: customListView(unidades, index),
      ),
      bottomSheet: Platform.isWindows
          ? Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Switch"),
                  IconButton(
                    onPressed: () {
                      List<String> switches = [];
                      var unit = unidades[index]["ipgerenciaswitch"];
                      if (unit.contains("/")) {
                        switches = unit.split("/");
                        ipcontroller.ipSelection(switches);
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
                                'More than one switch detected.\nSelect one from the list to connect to.'),
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
                                  items: ipcontroller.mutableList
                                      .map((selectedType) {
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
                                  Process.run('putty.exe', [
                                    '-ssh',
                                    ipcontroller.selected.value,
                                  ]);
                                  unit = '';
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                        );
                      } else {
                        Process.run('putty.exe', [
                          '-ssh',
                          unit,
                        ]);
                        unit = '';
                      }
                    },
                    icon: Icon(Icons.outbond),
                    tooltip: "ssh",
                  ),
                  IconButton(
                    onPressed: () {
                      List<String> switches = [];
                      var unit = unidades[index]["ipgerenciaswitch"];
                      if (unit.contains("/")) {
                        switches = unit.split("/");
                        ipcontroller.ipSelection(switches);
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
                                'More than one switch detected.\nSelect one from the list to ping to.'),
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
                                  items: ipcontroller.mutableList
                                      .map((selectedType) {
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
                                child: const Text("Ping"),
                                onPressed: () {
                                  Process.run('cmd', [
                                    '/c',
                                    'start ping ${ipcontroller.selected.value}',
                                  ]);
                                  unit = '';
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                        );
                      } else {
                        Process.run('cmd', [
                          '/c',
                          'start ping $unit',
                        ]);
                        unit = '';
                      }
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
                      var unit = unidades[index]["ipgerenciaonu"];
                      List<String> onus = [];
                      if (unit.contains("/")) {
                        onus = unit.split("/");
                        ipcontroller.ipSelection(onus);
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
                                'More than one Onu detected.\nSelect one from the list to connect to.'),
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
                                  items: ipcontroller.mutableList
                                      .map((selectedType) {
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
                                  Process.run('putty.exe', [
                                    '-ssh',
                                    ipcontroller.selected.value,
                                  ]);
                                  unit = '';
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                        );
                      } else {
                        Process.run('putty.exe', [
                          '-ssh',
                          unit,
                        ]);
                        unit = '';
                      }
                    },
                    icon: Icon(Icons.outbond),
                    tooltip: "ssh",
                    color: Colors.purple,
                  ),
                  IconButton(
                    onPressed: () {
                      var unit = unidades[index]['ipgerenciaonu'];
                      List<String> onus = [];
                      if (unit.contains("/")) {
                        onus = unit.split("/");
                        ipcontroller.ipSelection(onus);
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
                                'More than one onu detected.\nSelect one from the list to ping to.'),
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
                                  items: ipcontroller.mutableList
                                      .map((selectedType) {
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
                                child: const Text("Ping"),
                                onPressed: () {
                                  Process.run('cmd', [
                                    '/c',
                                    'start ping ${ipcontroller.selected.value}',
                                  ]);
                                  unit = '';
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                        );
                      } else {
                        Process.run('cmd', [
                          '/c',
                          'start ping $unit',
                        ]);
                        unit = '';
                      }
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
              ),
            )
          : Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.5),
              ),
            ),
    );
  }
}
