import 'dart:convert';
import 'dart:math';

import 'package:epicor/model/response.dart';
import 'package:epicor/model/ud01.dart';
import 'package:epicor/service/ud01_service.dart';
import 'package:epicor/util/constants.dart';
import 'package:epicor/view/ud01/ud01_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UD01Controller extends GetxController {
  TextEditingController key1Controller = TextEditingController();
  TextEditingController char1Controller = TextEditingController();
  TextEditingController char2Controller = TextEditingController();
  TextEditingController number1Controller = TextEditingController();
  List<UD01> ud01s = <UD01>[];
  bool isLoading = true;
  int count = 0;

  Future getList() async {
    ResponseAPI response = await UD01Service().getList();
    if (response.code == 200) {
      ud01s = response.data;
      //print(ud01s);
    } else {}
    // Future.delayed(
    //   const Duration(milliseconds: 100),
    //   () {
    //     // print('isloading false');
    //     isLoading = false; // Set isloading to false after 2 second.
    //   },
    // );

    isLoading = false;
    update();
    //ud01s = List.generate(ud!.value!.length, (index) => UD01());
  }

  Future editItem(UD01 model) async {
    try {
      ResponseAPI response = await UD01Service().edit(model);
      if (response.code == 201) {
        clearData();
        Get.back();
        Get.snackbar("Success", "Data has been edited.",
            colorText: Color.fromARGB(255, 255, 255, 255),
            duration: Duration(milliseconds: 1550));

        await getList();
      } else {
        Get.snackbar("Error", "Something went wrong.",
            colorText: Color.fromARGB(255, 255, 255, 255),
            duration: Duration(milliseconds: 1550));
      }
    } catch (e) {
      print('Error $e');
    }
  }

  Future addItem(UD01 model) async {
    try {
      if (model.Key1.isNotEmpty) {
        ResponseAPI response = await UD01Service().add(model);
        if (response.code == 201) {
          clearData();
          Get.back();
          Get.snackbar("Success", "New data has been added.",
              colorText: Color.fromARGB(255, 255, 255, 255),
              duration: Duration(milliseconds: 1550));
        }

        await getList();
      } else {
        Get.snackbar('Erorr', 'Key must not be empty!',
            colorText: Color.fromARGB(255, 255, 255, 255),
            duration: Duration(milliseconds: 1550));
      }
    } catch (e) {
      print('Error $e');
    }
  }

  Future deleteItem(String id) async {
    try {
      ResponseAPI response = await UD01Service().remove(id);
      if (response.code == 204) {
        Get.snackbar("Success", "Data has been deleted.",
            colorText: Color.fromARGB(255, 255, 255, 255),
            duration: Duration(milliseconds: 1550));

        await getList();
      } else {
        Get.snackbar('Erorr', 'Something went wrong',
            colorText: Color.fromARGB(255, 255, 255, 255),
            duration: Duration(milliseconds: 1550));
      }
    } catch (e) {
      print('Error $e');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getList();
    //clearData();
    super.onInit();
  }

  passData(UD01 model) {
    key1Controller.text = model.Key1;
    char1Controller.text = model.Character01!;
    char2Controller.text = model.Character02!;
    number1Controller.text = model.Number01!;
  }

  clearData() {
    key1Controller.clear();
    char1Controller.clear();
    char2Controller.clear();
    number1Controller.clear();
  }
}
