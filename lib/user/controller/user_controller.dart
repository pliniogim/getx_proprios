import 'package:get/get.dart';
import 'package:flutter/material.dart';

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

  void submit() {
    final isValid = formKey.currentState!.validate();
    Get.focusScope!.unfocus();
    if (isValid) {
      formKey.currentState!.save();
      debugPrint(name);
      debugPrint(email);
      debugPrint(level);
      debugPrint(password);
    }
  }
}
