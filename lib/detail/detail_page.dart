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
    );
  }
}
