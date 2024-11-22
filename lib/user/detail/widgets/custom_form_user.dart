import 'package:flutter/material.dart';

import 'package:proprios/user/controller/user_controller.dart';
import 'package:proprios/utils/constants/constants.dart';

class CustomFormUser extends StatelessWidget {
  const CustomFormUser({
    super.key,
    required this.userController,
    required this.users,
    required this.index,
  });

  final UserController userController;
  final List<Map<String, dynamic>> users;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
