// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/utils/constants/constants.dart';

class InfoController extends GetxController {
  //observable textfield email value
  var email = ''.obs;
  //observable textfield password value
  var password = ''.obs;

  //text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //copy of users data table
  List<Map<String, dynamic>> mutableList = [];

  //list of users passed
  void updateList(List<Map<String, dynamic>> users) {
    mutableList = List<Map<String, dynamic>>.from(users);
    //validate
    submit();
  }

  // validate email entered
  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return kValidEmail;
    }
    return null;
  }

  // validate password entered
  String? validatePassword(String value) {
    if (value.length < 6) {
      return kValidPassword;
    }
    return null;
  }

  // validate data versus user data table
  void submit() {
    if (validateEmail(email.value) == null &&
        validatePassword(password.value) == null) {
      // locate email in db list
      final int matchingIndex =
          mutableList.indexWhere((item) => item['email'] == email.value);

      // if found display success snack bar
      if (matchingIndex != -1) {
        // email and password are valid
        if (mutableList[matchingIndex]['password'] == password.value) {
          Get.snackbar(
              kSuccess, "Bem-vindo, ${mutableList[matchingIndex]['name']}",
              snackPosition: SnackPosition.BOTTOM);

          // Land page
          Get.offAllNamed('/home');
        } else {
          // found, but password is invalid
          Get.snackbar(kError, kErrorEmailPasswd,
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        // not found, data is invalid
        Get.snackbar(kError, kErrorEmailPasswd,
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      // no required data entered
      Get.snackbar(kError, kProvValidInfo, snackPosition: SnackPosition.BOTTOM);
    }
  }
}
