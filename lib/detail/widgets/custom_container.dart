import 'package:flutter/material.dart';

Widget customContainter(String text, String data) {
  return Container(
    height: 60.0,
    color: Colors.greenAccent,
    child: Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        left: 10.0,
        right: 10.0,
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(data),
          ),
        ],
      ),
    ),
  );
}
