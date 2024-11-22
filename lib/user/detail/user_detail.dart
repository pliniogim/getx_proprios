import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proprios/home/widgets/custom_appbar.dart';
import 'package:proprios/user/controller/user_controller.dart';
import 'package:proprios/user/detail/widgets/custom_form_user.dart';
import 'package:proprios/user/detail/widgets/custom_user_bottom_sheet.dart';

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
      body: CustomFormUser(
          userController: userController, users: users, index: index),
      bottomSheet: CustomUserBottomSheet(),
    );
  }
}
