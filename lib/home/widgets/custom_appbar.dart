import 'package:flutter/material.dart';

customAppBar(List<Map<String, dynamic>> unidades) {
  return AppBar(
    title: Text(
      'PRÓPRIOS - PMSCS (${unidades.length})',
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(255, 103, 231, 1),
      ),
    ),
  );
}
