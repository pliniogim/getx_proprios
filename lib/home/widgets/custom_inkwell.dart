import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../detail/detail_page.dart';

class HomePageInkwell extends StatelessWidget {
  const HomePageInkwell({
    super.key,
    required this.unidades,
    required this.index,
  });

  final List<Map<String, dynamic>> unidades;
  final int index;

  @override
  Widget build(BuildContext context) {
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
          left: 5.0,
          right: 5.0,
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
  }
}
