// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  List<Map<String, dynamic>> mutableList = [];

  void updateList(List<Map<String, dynamic>> users) {
    mutableList = List<Map<String, dynamic>>.from(users);
    submit();
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide a valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  void submit() {
    if (validateEmail(email.value) == null &&
        validatePassword(password.value) == null) {
      final int matchingIndex =
          mutableList.indexWhere((item) => item['email'] == email.value);
      if (matchingIndex != -1) {
        if (mutableList[matchingIndex]['password'] == password.value) {
          Get.snackbar("Success", "Data is valid",
              snackPosition: SnackPosition.BOTTOM);
          Get.offAllNamed('/home');
        } else {
          Get.snackbar("Error", "Email or password invalid",
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        Get.snackbar("Error", "Email or password invalid",
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar("Error", "Please provide valid information",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}

class LoginPage extends StatelessWidget {
  final InfoController infocontroller = Get.put(InfoController());

  final List<Map<String, dynamic>> users;
  LoginPage({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 15.0,
        shadowColor: Colors.greenAccent,
        title: Text(
          'Próprios - PMSCS',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/Gemini_Generated_Image_o8c8z7o8c8z7o8c8.jpg'),
                // opacity: 0.5,
                fit: BoxFit.cover, // This will fill the container
              ),
              color: Colors.greenAccent.withOpacity(0.5),
              // borderRadius: BorderRadius.only(
              //   bottomLeft: Radius.circular(30.0),
              //   bottomRight: Radius.circular(30.0),
              // ),
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
                  hintText: 'E-mail',
                  hintStyle: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
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
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
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
      ),
      bottomSheet: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.greenAccent.withOpacity(0.5),
        ),
        child: Center(
          child: Text(
            'Copyright \u00a9 2024, plg/dti',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
            ),
          ),
        ),
      ),
    );
  }
}
