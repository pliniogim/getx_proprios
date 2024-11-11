import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/home/home_page.dart';
import 'package:proprios/login/login_page.dart';
import 'package:proprios/onus/onus_page.dart';
import 'package:proprios/redes/rede_dados.dart';
import 'package:proprios/switches/switches_page.dart';
import 'package:proprios/vlan/vlan_page.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:proprios/utils/database/dbclass.dart';

Future main() async {
  //platform check, for android use sqlite on system
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    appWindow.size = const Size(400, 800);
    sqfliteFfiInit();
  }

  // factory class
  databaseFactory = databaseFactoryFfi;
  // database in memory
  var db = await databaseFactory.openDatabase(inMemoryDatabasePath);

  // create proprios database
  await db.execute(kSqlCreate);
  // insert data on proprios
  await db.execute(kSqlData);
  // query proprios to map
  var result = await db.query('proprios', orderBy: "descricao ASC");

  // create users database
  await db.execute(kSqlUserCreate);
  // create users data
  await db.execute(kSqlUserData);
  // query users to map
  var users = await db.query('users', orderBy: "email ASC");

  // close database
  await db.close();

  //run app passing result databaseq
  runApp(MyApp(
    unidades: result,
    users: users,
  ));
}

class MyApp extends StatelessWidget {
  final List<Map<String, dynamic>> unidades;
  final List<Map<String, dynamic>> users;

  const MyApp({required this.unidades, required this.users, super.key});

  @override
  Widget build(BuildContext context) {
    //use of Get
    return GetMaterialApp(
      navigatorKey: Get.key,
      initialRoute: '/login',
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
        GetPage(
          name: '/onus',
          page: () => OnusPage(unidades: unidades),
          // binding: HomeBinding(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginPage(users: users),
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
