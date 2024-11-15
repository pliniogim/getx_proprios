import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proprios/detail/controller/ip_controller.dart';
import 'package:proprios/detail/widgets/custom_detail_row.dart';
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
              child: CustomDetailRow(
                  unidades: unidades, index: index, ipcontroller: ipcontroller),
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
