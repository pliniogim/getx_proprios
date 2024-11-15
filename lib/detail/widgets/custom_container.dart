import 'package:flutter/material.dart';

Widget customContainter(String text, String data) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.greenAccent,
      borderRadius: BorderRadius.circular(10.0),
    ),
    height: (text == "Switches: " && data.contains('/')) ? 75.0 : 60.0,
    child: Padding(
      padding: const EdgeInsets.only(
        top: 2.0,
        bottom: 2.0,
        left: 2.0,
        right: 2.0,
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
            child: Text(
              data,
              textScaler: TextScaler.linear(0.9),
            ),
          ),
        ],
      ),
    ),
  );
}
