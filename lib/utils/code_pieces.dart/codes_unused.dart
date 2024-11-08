//FloatingButton on home Scaffold
   // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.lightGreenAccent,
      //   tooltip: 'Search...',
      //   onPressed: () async {
      //     await Future.delayed(const Duration(milliseconds: 500));
      //     Get.to(
      //       () => SearchPage(
      //         unidades: unidades,
      //       ),
      //     );
      //     // Get.to(SearchPage());
      //   },
      //   child: Icon(
      //     Icons.search,
      //     color: Colors.green,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

//not used appbar actions on home page 
 //   Padding(
    //     padding: const EdgeInsets.only(right: 12.0),
    //     child: IconButton(
    //       icon: const Icon(Icons.compare_arrows_rounded),
    //       tooltip: 'Data network list page',
    //       onPressed: () async {
    //         await Future.delayed(const Duration(milliseconds: 500));
    //         Get.to(
    //           () => RedeDados(
    //             unidades: unidades,
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    //   Padding(
    //     padding: const EdgeInsets.only(right: 12.0),
    //     child: IconButton(
    //       icon: const Icon(Icons.router_outlined),
    //       tooltip: 'Switches list page',
    //       onPressed: () async {
    //         await Future.delayed(const Duration(milliseconds: 500));
    //         Get.to(
    //           () => SwitchesPage(
    //             unidades: unidades,
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    //   Padding(
    //     padding: const EdgeInsets.only(right: 12.0),
    //     child: IconButton(
    //       icon: const Icon(Icons.switch_access_shortcut),
    //       tooltip: 'Onus list page',
    //       onPressed: () async {
    //         await Future.delayed(const Duration(milliseconds: 500));
    //         Get.to(
    //           () => OnusPage(
    //             unidades: unidades,
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // ],


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