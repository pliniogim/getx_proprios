import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proprios/home/widgets/custom_appbar.dart';
import 'package:proprios/user/controller/user_controller.dart';
import 'package:proprios/utils/constants/constants.dart';

class UserDetail extends StatelessWidget {
  final List<Map<String, dynamic>> unidades;
  final List<Map<String, dynamic>> users;
  final int index;
  const UserDetail(
      {super.key,
      required this.unidades,
      required this.users,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());

    return Scaffold(
      appBar: customAppBar(unidades),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: userController.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  autofocus: true,
                  initialValue: users[index]['name'],
                  validator: (value) {
                    return userController.validateName(value!);
                  },
                  decoration: InputDecoration(
                    labelText: kPageUserDetailName,
                  ),
                  onSaved: (value) {
                    userController.name = value!;
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  initialValue: users[index]['email'],
                  validator: (value) {
                    return userController.validateEmail(value!);
                  },
                  decoration: InputDecoration(
                    labelText: kPageUserDetailName,
                  ),
                  onSaved: (value) {
                    userController.email = value!;
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  initialValue: users[index]['level'],
                  validator: (value) {
                    return userController.validateLevel(value!);
                  },
                  decoration: InputDecoration(
                    labelText: kPageUserDetailName,
                  ),
                  onSaved: (value) {
                    userController.level = value!;
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  obscureText: true,
                  initialValue: users[index]['password'],
                  validator: (value) {
                    return userController.validatePassword(value!);
                  },
                  decoration: InputDecoration(
                    labelText: kPageUserDetailName,
                  ),
                  onSaved: (value) {
                    userController.password = value!;
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        userController.submit();
                      },
                      child: Text("Enviar")),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 50,
        decoration: BoxDecoration(
          color: kSecondaryOpac,
        ),
        child: Center(
          child: Text(
            kCopyright,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: kBottomSheetText,
            ),
          ),
        ),
      ),
    );
  }
}
