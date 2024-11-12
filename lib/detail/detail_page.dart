import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proprios/detail/widgets/custom_listview.dart';
import 'package:proprios/home/widgets/custom_appbar.dart';

class DetailPage extends StatelessWidget {
  final int index;
  final List<Map<String, dynamic>> unidades;
  const DetailPage({super.key, required this.index, required this.unidades});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(unidades),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                      var unit = unidades[index]["ipgerenciaswitch"];
                      Process.run('putty.exe', [
                        '-ssh',
                        unit,
                      ]);
                      unit = '';
                    },
                    icon: Icon(Icons.outbond),
                    tooltip: "ssh",
                  ),
                  IconButton(
                    onPressed: () {
                      var unit = unidades[index]['ipgerenciaswitch'];
                      Process.run('cmd', [
                        '/c',
                        'start ping $unit',
                      ]);
                      unit = '';
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
                      Process.run('putty.exe', [
                        '-ssh',
                        unit,
                      ]);
                      unit = '';
                    },
                    icon: Icon(Icons.outbond),
                    tooltip: "ssh",
                    color: Colors.purple,
                  ),
                  IconButton(
                    onPressed: () {
                      var unit = unidades[index]['ipgerenciaonu'];
                      Process.run('cmd', [
                        '/c',
                        'start ping $unit',
                      ]);
                      unit = '';
                    },
                    icon: Icon(Icons.swap_horiz),
                    tooltip: "ping",
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
