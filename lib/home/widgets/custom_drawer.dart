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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('PMSCS'),
          ),
          ListTile(
            title: Text('Home'),
            tileColor: Get.currentRoute == '/home' ? Colors.grey[300] : null,
            onTap: () {
              Get.back();
              Get.offAllNamed('/home');
            },
          ),
          ListTile(
            title: Text('Lista de Vlans'),
            tileColor: Get.currentRoute == '/vlans' ? Colors.grey[300] : null,
            onTap: () {
              Get.back();
              Get.offAllNamed('/vlans');
            },
          ),
          ListTile(
            title: Text('Lista de Redes'),
            tileColor: Get.currentRoute == '/redes' ? Colors.grey[300] : null,
            onTap: () {
              Get.back();
              Get.offAllNamed('/redes');
            },
          ),
          ListTile(
            title: Text('Lista de Switches'),
            tileColor:
                Get.currentRoute == '/switches' ? Colors.grey[300] : null,
            onTap: () {
              Get.back();
              Get.toNamed('/switches');
            },
          ),
        ],
      ),
    );
  }
}
