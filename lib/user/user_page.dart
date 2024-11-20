// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proprios/home/widgets/custom_appbar.dart';
import 'package:proprios/home/widgets/custom_drawer.dart';
import 'package:proprios/user/detail/user_detail.dart';
import 'package:proprios/utils/constants/constants.dart';

class UserPage extends StatelessWidget {
  final List<Map<String, dynamic>> users;
  final List<Map<String, dynamic>> unidades;
  const UserPage({
    super.key,
    required this.users,
    required this.unidades,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(unidades),
      drawer: CustomDrawer(unidades: unidades),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: EdgeInsets.only(
                left: 5.0,
                right: 5.0,
                bottom: 10.0,
              ),
              color: Colors.greenAccent,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Text(
                            users[index]['id'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Text(
                            users[index]['name'],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            users[index]['email'],
                          ),
                        ),
                        IconButton(
                          tooltip: kChangeUserButtonText,
                          onPressed: () {
                            Get.to(
                              UserDetail(
                                index: index,
                                unidades: unidades,
                                users: users,
                              ),
                            );
                          },
                          icon: const Icon(Icons.supervised_user_circle),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
