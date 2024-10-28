import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:proprios/detail/detail_page.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// import 'package:proprios/home/widgets/custom_appbar.dart';

class MyController extends GetxController {
  // late List<Map<String, dynamic>> unidades;
  late Future<List<Map<String, dynamic>>> _unidadesFuture;
  List<Map<String, dynamic>> unidades = [];
  @override
  void onInit() async {
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
    _unidadesFuture = db.query('proprios', orderBy: "descricao ASC");

    //close db
    await db.close();

    super.onInit();
  }

  final searchText = 'A'.obs;

  Future<List<Map<String, dynamic>>> get unidadesFuture => _unidadesFuture;

  List<Map<String, dynamic>> get unidadesFiltradas => unidades
      .where((unidades) =>
          unidades["unidade"]
              .toLowerCase()
              .contains(searchText.value.toLowerCase()) ||
          unidades["descricao"]
              .toLowerCase()
              .contains(searchText.value.toLowerCase()) ||
          unidades['rededados']
              .toLowerCase()
              .contains(searchText.value.toLowerCase()))
      .toList();
}

class SearchPage extends StatelessWidget {
  final List<Map<String, dynamic>> unidades;
  final MyController controller = Get.put(MyController());

  SearchPage({super.key, required this.unidades});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) => controller.searchText.value = value,
          decoration: InputDecoration(hintText: 'Pesquisar'),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: controller._unidadesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            controller.unidades = snapshot.data!;
            return Obx(() => ListView.builder(
                  itemCount: controller.unidadesFiltradas.length,
                  itemBuilder: (context, index) {
                    final unidade = controller.unidadesFiltradas[index];
                    return InkWell(
                      onTap: () {
                        final matchingIndex = unidades.indexWhere(
                            (item) => item['unidade'] == unidade['unidade']);
                        Get.to(
                          DetailPage(
                            index: matchingIndex,
                            unidades: unidades,
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 20.0,
                        ),
                        child: ListTile(
                          tileColor: Colors.greenAccent,
                          title: Text(
                            unidade["unidade"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(unidade["descricao"]),
                          trailing: Text(
                            unidade["rededados"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ));
          } else {
            return const Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}
