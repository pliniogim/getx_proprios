// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/login/controller/info_controller.dart';

class CustomColumn extends StatelessWidget {
  const CustomColumn({
    super.key,
    required this.infocontroller,
    required this.users,
  });

  final InfoController infocontroller;
  final List<Map<String, dynamic>> users;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/Gemini_Generated_Image_o8c8z7o8c8z7o8c8.jpg'),
              fit: BoxFit.cover, // This will fill the container
            ),
            color: Colors.greenAccent.withOpacity(0.5),
          ),
          height: 200,
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Obx(
            () => TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                errorText:
                    infocontroller.validateEmail(infocontroller.email.value),
              ),
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
              controller: infocontroller.passwordController,
              onChanged: (value) => infocontroller.password.value = value,
              decoration: InputDecoration(
                labelText: 'Password',
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
                infocontroller.updateList(users);
              },
              child: Text("Login")),
        ),
      ],
    );
  }
}
