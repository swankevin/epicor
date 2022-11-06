import 'package:epicor/service/auth_service.dart';
import 'package:epicor/view/ud01/ud01_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = TextEditingController();
  var password = TextEditingController();

  Future<void> login() async {
    Map<dynamic, dynamic> data = {
      'username': username.text,
      'password': password.text
    };
    try {
      var response = await AuthService().connect(data);

      if (response == true) {
        Get.off(() => UD01Screen()); // go to home page
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          Get.snackbar("Login failed", "Either username or password is wrong",
              colorText: Color.fromARGB(255, 255, 255, 255),
              duration: Duration(milliseconds: 2000));
          //isLoading.value = false; // go to home page
        });
      }
    } catch (e) {}
  }

  void logout() {
    username.clear();
    password.clear();
    Get.off(() => UD01Screen());
  }
}
