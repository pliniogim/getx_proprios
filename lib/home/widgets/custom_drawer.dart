// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/utils/constants/constants.dart';

class CustomDrawer extends StatelessWidget {
  final List<Map<String, dynamic>> unidades;
  const CustomDrawer({
    super.key,
    required this.unidades,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Drawer(
        elevation: 15.0,
        shadowColor: kSecondaryColor,
        backgroundColor: kPrimaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.85),
              ),
              child: Text(
                kAppbarTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kGreen800,
                ),
              ),
            ),
            ListTile(
              title: Text(
                kPageHomeTitle,
                style: TextStyle(
                  fontSize: kDrawerTitleText,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                ),
              ),
              tileColor:
                  Get.currentRoute == kPageHomeRoute ? kSecondaryColor : null,
              onTap: () {
                Get.back();
                Get.offAllNamed(kPageHomeRoute);
              },
            ),
            ListTile(
              title: Text(
                kPageVlanTitle,
                style: TextStyle(
                  fontSize: kDrawerTitleText,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                ),
              ),
              tileColor:
                  Get.currentRoute == kPageVlanRoute ? kSecondaryColor : null,
              onTap: () {
                Get.back();
                Get.offAllNamed(kPageVlanRoute);
              },
            ),
            ListTile(
              title: Text(
                kPageRedesTitle,
                style: TextStyle(
                  fontSize: kDrawerTitleText,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                ),
              ),
              tileColor:
                  Get.currentRoute == kPageRedesRoute ? kSecondaryColor : null,
              onTap: () {
                Get.back();
                Get.offAllNamed(kPageRedesRoute);
              },
            ),
            ListTile(
              title: Text(
                kPageSwitchesTitle,
                style: TextStyle(
                  fontSize: kDrawerTitleText,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                ),
              ),
              tileColor: Get.currentRoute == kPageSwitchesRoute
                  ? kSecondaryColor
                  : null,
              onTap: () {
                Get.back();
                Get.toNamed(kPageSwitchesRoute);
              },
            ),
            ListTile(
              title: Text(
                kPageOnusTitle,
                style: TextStyle(
                  fontSize: kDrawerTitleText,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                ),
              ),
              tileColor:
                  Get.currentRoute == kPageOnusRoute ? kSecondaryColor : null,
              onTap: () {
                Get.back();
                Get.toNamed(kPageOnusRoute);
              },
            ),
            Divider(
              height: 5,
              thickness: 2.0,
              color: Colors.white,
            ),
            ListTile(
              title: Text(
                kPageUsersTitle,
                style: TextStyle(
                  fontSize: kDrawerTitleText,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                ),
              ),
              tileColor: Get.currentRoute == kPageUsersRoute
                  ? Colors.greenAccent
                  : null,
              onTap: () {
                Get.back();
                Get.toNamed(kPageUsersRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
