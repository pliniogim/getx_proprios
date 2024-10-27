import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/detail/detail_page.dart';
import 'package:proprios/home/widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> unidades;
  const HomePage({required this.unidades, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              color: Colors.greenAccent,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          child: Text(
                            unidades[index]['unidade'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          unidades[index]['descricao'],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
