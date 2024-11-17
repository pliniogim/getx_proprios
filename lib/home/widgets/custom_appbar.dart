import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proprios/search/search_page.dart';
import 'package:proprios/utils/constants/constants.dart';

customAppBar(List<Map<String, dynamic>> unidades) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: kPrimaryColor,
    elevation: kElevation,
    shadowColor: kPrimaryColor,
    title: Text(
      '$kAppbarTitle (${unidades.length})',
      style: TextStyle(
        fontSize: kAppBarText,
        fontWeight: FontWeight.bold,
        color: kWhite,
      ),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: IconButton(
          icon: kIconSearch,
          tooltip: kSearchPage,
          onPressed: () async {
            // delay time for wait the db read/construc table
            await Future.delayed(const Duration(milliseconds: 500));
            Get.to(
              () => SearchPage(
                unidades: unidades,
              ),
            );
          },
        ),
      ),
    ],
  );
}
