import 'package:epicor/controller/login_controller.dart';
import 'package:epicor/util/reusables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(LoginController());
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringtoColor("D70071"),
              hexStringtoColor("CB2B93"),
              hexStringtoColor("9546C4"),
              hexStringtoColor("5E61F4"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/logo1.png"),
                const SizedBox(height: 30),
                reusableTextField("Enter Username", Icons.person_outline, false,
                    _controller.username),
                const SizedBox(height: 10),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _controller.password),
                const SizedBox(height: 10),
                signButton(context, true, () async {
                  _controller.login();
                }),
                //signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
