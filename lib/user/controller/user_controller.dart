import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class UserController extends GetxController {
  final formKey = GlobalKey<FormState>();

  var name = '';
  var email = '';
  var level = '';
  var password = '';

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final levelController = TextEditingController();
  final passwordController = TextEditingController();

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Forneça um nome (nome não pode ser vazio)";
    }
    return null;
  }

  String? validateLevel(String value) {
    if (value.isEmpty) {
      return "Valor inválido (administrador ou usuário)";
    } else {
      if (value == "administrador" || value == "usuário") {
        return null;
      } else {
        return "Valor inválido (administrador ou usuário)";
      }
    }
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Forneça um e-mail válido";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty || value.length < 6) {
      return 'Password precisa ter pelo menos 6 caracteres.';
    }
    return null;
  }

  void submit() async {
    final isValid = formKey.currentState!.validate();
    Get.focusScope!.unfocus();
    if (isValid) {
      formKey.currentState!.save();
      databaseFactory = databaseFactoryFfi;
      var databasesPath = await getApplicationDocumentsDirectory();
      String path = join(databasesPath.path, 'proprios.db');
      var db = await databaseFactory.openDatabase(path);
      await db.rawUpdate(
          'UPDATE users SET name = ?, email = ?, level = ?, password = ? WHERE email = ?',
          [name, email, level, password, email]);
      db.close();
      Get.back();
    }
  }
}
