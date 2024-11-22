import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:proprios/user/user_page.dart';
import 'package:proprios/utils/constants/constants.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:proprios/home/home_page.dart';
import 'package:proprios/login/login_page.dart';
import 'package:proprios/onus/onus_page.dart';
import 'package:proprios/redes/rede_dados.dart';
import 'package:proprios/switches/switches_page.dart';
import 'package:proprios/utils/database/dbclass.dart';
import 'package:proprios/vlan/vlan_page.dart';

Future main() async {
  //platform check, for android use sqlite on system
  if (Platform.isWindows || Platform.isLinux) {
    //await widgets being initialized
    WidgetsFlutterBinding.ensureInitialized();

    // preferred initial size of window
    // all k constants are from util/constants/constants.dart except database ones
    appWindow.size = kWindSize;

    // Initialize FFI
    sqfliteFfiInit();
  }

  // factory class
  databaseFactory = databaseFactoryFfi;
  var databasesPath = Directory.current.path;
  String path = join(databasesPath, 'proprios.db');

  // database in memory
  var db = await databaseFactory.openDatabase(
    path,
    options: OpenDatabaseOptions(
        version: 1,
        onCreate: (db, version) async {
          db.execute(kSqlCreate);
          db.execute(kSqlData);
          db.execute(kSqlUserCreate);
          db.execute(kSqlUserData);
        }),
  );

  // create proprios database
  // all database k constants are from utils/database/dbclass.dart ...git ignored

  // Database proprios sql create:
  // CREATE TABLE proprios(
  // unidade TEXT PRIMARY KEY,
  // descricao TEXT NOT NULL,
  // hostname text NOT NULL,
  // statusativacao text,
  // dataativacao text,
  // vlandados text,
  // rededados text,
  // vlanvoz text,
  // redevoz text,
  // vlanwifiadm text,
  // redewifiadm text,
  // ipgerenciaswitch text,
  // ipgerenciaonu text,
  // vlanpedagogica text,
  // redepedagogica text,
  // olt text,
  // obs text)
  //await db.execute(kSqlCreate);

  // insert data on proprios
  // INSERT INTO "proprios" ("unidade",
  //"descricao",
  //"hostname",
  //"statusativacao",
  //"dataativacao",
  //"vlandados",
  //"rededados",
  //"vlanvoz",
  //"redevoz",
  //"vlanwifiadm",
  //"redewifiadm",
  //"ipgerenciaswitch",
  //"ipgerenciaonu",
  //"vlanpedagogica",
  //"redepedagogica",
  //"olt",
  //"obs") VALUES (...)
  //await db.execute(kSqlData);

  // query proprios to map
  var result = await db.query(kDataUnitTable, orderBy: kDataOrder);

  // create users database
  // user sql from utils/database/dbclass.dart
  //   CREATE TABLE IF NOT EXISTS "users" (
  // 	"id"	integer NOT NULL,
  // 	"email"	text NOT NULL,
  // 	"password"	text NOT NULL,
  // 	"level"	INTEGER,
  // 	PRIMARY KEY("id")
  // );
  //await db.execute(kSqlUserCreate);

  // create users data
  // INSERT INTO "users" ("id","email","password","level") VALUES (...)
  //await db.execute(kSqlUserData);

  // query users to map
  var users = await db.query(kUserTable, orderBy: kUserOrder);

  // close database
  await db.close();

  //run app passing result database queries as List<Map<String, dynamic>>
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
    //use of Get throughout the app
    return GetMaterialApp(
      navigatorKey: Get.key,
      initialRoute: '/login',
      //routes to get pages
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginPage(users: users),
        ),
        GetPage(
          name: '/home',
          page: () => HomePage(unidades: unidades),
        ),
        GetPage(
          name: '/vlans',
          page: () => VlanPage(unidades: unidades),
        ),
        GetPage(
          name: '/redes',
          page: () => RedeDados(unidades: unidades),
        ),
        GetPage(
          name: '/switches',
          page: () => SwitchesPage(unidades: unidades),
        ),
        GetPage(
          name: '/onus',
          page: () => OnusPage(unidades: unidades),
        ),
        GetPage(
          name: '/users',
          page: () => UserPage(unidades: unidades, users: users),
        ),
      ],
      debugShowCheckedModeBanner: false,
      title: kWindowTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kSecondaryColor),
        useMaterial3: true,
      ),
    );
  }
}
