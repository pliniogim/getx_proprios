import 'package:flutter/material.dart';

Widget customContainter(String text, String data) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.greenAccent,
      borderRadius: BorderRadius.circular(10.0),
    ),
    height: 60.0,
    child: Padding(
      padding: const EdgeInsets.only(
        top: 5.0,
        bottom: 5.0,
        left: 5.0,
        right: 5.0,
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
