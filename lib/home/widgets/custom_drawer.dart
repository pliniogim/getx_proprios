// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  final List<Map<String, dynamic>> unidades;
  const CustomDrawer({
    super.key,
    required this.unidades,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Drawer(
        elevation: 15.0,
        shadowColor: Colors.greenAccent,
        backgroundColor: Colors.green,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.85),
              ),
              child: Text(
                'PMSCS - Próprios',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              tileColor:
                  Get.currentRoute == '/home' ? Colors.greenAccent : null,
              onTap: () {
                Get.back();
                Get.offAllNamed('/home');
              },
            ),
            ListTile(
              title: Text(
                'Lista de Vlans',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              tileColor:
                  Get.currentRoute == '/vlans' ? Colors.greenAccent : null,
              onTap: () {
                Get.back();
                Get.offAllNamed('/vlans');
              },
            ),
            ListTile(
              title: Text(
                'Lista de Redes',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              tileColor:
                  Get.currentRoute == '/redes' ? Colors.greenAccent : null,
              onTap: () {
                Get.back();
                Get.offAllNamed('/redes');
              },
            ),
            ListTile(
              title: Text(
                'Lista de Switches',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              tileColor:
                  Get.currentRoute == '/switches' ? Colors.greenAccent : null,
              onTap: () {
                Get.back();
                Get.toNamed('/switches');
              },
            ),
            ListTile(
              title: Text(
                'Lista de Onus',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              tileColor:
                  Get.currentRoute == '/onus' ? Colors.greenAccent : null,
              onTap: () {
                Get.back();
                Get.toNamed('/onus');
              },
            ),
          ],
        ),
      ),
    );
  }
}
