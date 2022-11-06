import 'package:epicor/controller/ud01_controller.dart';
import 'package:epicor/model/ud01.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class UD01EditScreen extends StatelessWidget {
  const UD01EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final _controller = Get.put(UD01Controller());
    //var data = Get.arguments;
    return GetBuilder<UD01Controller>(
      init: UD01Controller(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Edit Row'),
          ),
          body: ListView(
            padding: EdgeInsets.all(20),
            children: <Widget>[
              TextField(
                controller: controller.key1Controller,
                readOnly: true,
                decoration: InputDecoration(
                    hintText: 'Enter ID',
                    labelText: 'ID',
                    fillColor: Colors.grey),
              ),
              TextField(
                controller: controller.char1Controller,
                decoration: InputDecoration(
                    hintText: 'Enter Name', labelText: 'Fullname'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: controller.char2Controller,
                decoration: InputDecoration(
                    hintText: 'Enter Address', labelText: 'Address'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: controller.number1Controller,
                decoration: InputDecoration(
                    hintText: 'Enter Phone Number', labelText: "Phone"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Get.find<UD01Controller>().editItem(UD01(
                      Key1: controller.key1Controller.text,
                      Character01: controller.char1Controller.text,
                      Character02: controller.char2Controller.text,
                      Number01: controller.number1Controller.text));
                },
                child: Text('Confirm'),
              ),
            ],
          ),
        );
      },
    );
  }
}
