import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proprios/login/controller/info_controller.dart';
import 'package:proprios/utils/constants/constants.dart';

class CustomColumn extends StatelessWidget {
  const CustomColumn({
    super.key,
    required this.infocontroller,
    required this.users,
  });

  // user controller
  final InfoController infocontroller;
  // list of users
  final List<Map<String, dynamic>> users;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(kAssetImage),
                fit: BoxFit.cover, // This will fill the container
              ),
              color: kSecondaryOpac),
          height: kAssetImageHeight,
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Obx(
            () => TextField(
              decoration: InputDecoration(
                labelText: kEmail,
                errorText:
                    // validate email
                    infocontroller.validateEmail(infocontroller.email.value),
              ),
              // textfield controller
              controller: infocontroller.emailController,
              onChanged: (value) => infocontroller.email.value = value,
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Obx(
            () => TextField(
              // textfield controller
              controller: infocontroller.passwordController,
              onChanged: (value) => infocontroller.password.value = value,
              decoration: InputDecoration(
                labelText: kPassword,
                errorText: infocontroller
                    .validatePassword(infocontroller.password.value),
              ),
              obscureText: true,
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {
                // pass list of users from db to be checked against user entered values
                // if valid then land page -> home
                infocontroller.updateList(users);
              },
              child: Text(kLogin)),
        ),
      ],
    );
  }
}
