import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/home/home_page.dart';
import 'package:proprios/redes/rede_dados.dart';
import 'package:proprios/switches/switches_page.dart';
import 'package:proprios/vlan/vlan_page.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

Future main() async {
  appWindow.size = const Size(400, 800);

  //platform check, for android use sqlite on system
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
  }

  //factory class
  databaseFactory = databaseFactoryFfi;

  //directory search (user documents)
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();

  //join databases & database file name
  String dbPath = p.join(appDocumentsDir.path, "databases", "proprios.db");

  //open database
  var db = await databaseFactory.openDatabase(
    dbPath,
  );

  //select * from proprios
  var result = await db.query('proprios', orderBy: "descricao ASC");

  //close db
  await db.close();

  //run app passing result databaseq
  runApp(MyApp(
    unidades: result,
  ));
}

class MyApp extends StatelessWidget {
  final List<Map<String, dynamic>> unidades;
  const MyApp({required this.unidades, super.key});

  @override
  Widget build(BuildContext context) {
    //use of Get
    return GetMaterialApp(
      navigatorKey: Get.key,
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomePage(unidades: unidades),
          // binding: HomeBinding(),
        ),
        GetPage(
          name: '/vlans',
          page: () => VlanPage(unidades: unidades),
          // binding: HomeBinding(),
        ),
        GetPage(
          name: '/redes',
          page: () => RedeDados(unidades: unidades),
          // binding: HomeBinding(),
        ),
        GetPage(
          name: '/switches',
          page: () => SwitchesPage(unidades: unidades),
          // binding: HomeBinding(),
        ),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Próprios',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      // home: HomePage(unidades: unidades),
    );
  }
}
