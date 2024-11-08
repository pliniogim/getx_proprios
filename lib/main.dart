import 'dart:io';
// import 'package:path/path.dart' as p;
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite_common/sqlite_api.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/home/home_page.dart';
import 'package:proprios/onus/onus_page.dart';
import 'package:proprios/redes/rede_dados.dart';
import 'package:proprios/switches/switches_page.dart';
import 'package:proprios/vlan/vlan_page.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:proprios/utils/database/dbclass.dart';

// ///
// Future<Database> initDB() async {
//     if (Platform.isWindows || Platform.isLinux) {
//       sqfliteFfiInit();
//       final databaseFactory = databaseFactoryFfi;
//       final appDocumentsDir = await getApplicationDocumentsDirectory();
//       final dbPath = join(appDocumentsDir.path, "databases", "data.db");
//       final winLinuxDB = await databaseFactory.openDatabase(
//         dbPath,
//         options: OpenDatabaseOptions(
//           version: 1,
//           onCreate: _onCreate,
//         ),
//       );
//       return winLinuxDB;
//     } else if (Platform.isAndroid || Platform.isIOS) {
//       final documentsDirectory = await getApplicationDocumentsDirectory();
//       final path = join(documentsDirectory.path, "data.db");
//       final iOSAndroidDB = await openDatabase(
//         path,
//         version: 1,
//         onCreate: _onCreate,
//       );
//       return iOSAndroidDB;
//     }
//     throw Exception("Unsupported platform");
//   }
// ///

Future main() async {
  //platform check, for android use sqlite on system
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    appWindow.size = const Size(400, 800);
    sqfliteFfiInit();
  }

  //directory search (user documents)
  // flutterfinal Directory appDocumentsDir = await getApplicationDocumentsDirectory();

  //join databases & database file name
  // String dbPath = p.join(appDocumentsDir.path, "databases", "proprios.db");

  // //open database
  // var db = await databaseFactory.openDatabase(
  //   dbPath,
  // );
  //
  //select * from proprios
  //var result = await db.query('proprios', orderBy: "descricao ASC");
  //close db
  //Test Area

  // factory class
  databaseFactory = databaseFactoryFfi;
  var db = await databaseFactory.openDatabase(inMemoryDatabasePath);
  await db.execute(kSqlCreate);
  await db.execute(kSqlData);
  var result = await db.query('proprios', orderBy: "descricao ASC");
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
        GetPage(
          name: '/onus',
          page: () => OnusPage(unidades: unidades),
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
