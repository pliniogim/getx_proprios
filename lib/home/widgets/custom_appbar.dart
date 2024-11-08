import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/search/search_page.dart';

customAppBar(List<Map<String, dynamic>> unidades) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Colors.green,
    elevation: 15.0,
    shadowColor: Colors.green,
    title: Text(
      'PRÓPRIOS - PMSCS (${unidades.length})',
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: IconButton(
          icon: const Icon(Icons.search),
          tooltip: 'Search Page',
          onPressed: () async {
            await Future.delayed(const Duration(milliseconds: 500));
            Get.to(
              () => SearchPage(
                unidades: unidades,
              ),
            );
          },
        ),
      ),
    ],
  );
}
