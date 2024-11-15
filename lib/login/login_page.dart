import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proprios/login/controller/info_controller.dart';
import 'package:proprios/login/widgets/custom_column.dart';
import 'package:proprios/utils/constants/constants.dart';

class LoginPage extends StatelessWidget {
  // InfoController checks user inputs
  final InfoController infocontroller = Get.put(InfoController());

  // construtor
  final List<Map<String, dynamic>> users;
  LoginPage({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: kElevation,
        shadowColor: kSecondaryColor,
        title: Text(
          kAppbarTitle,
          style: TextStyle(
            fontSize: kAppBarText,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: CustomColumn(infocontroller: infocontroller, users: users),
      bottomSheet: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.greenAccent.withOpacity(0.5),
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
