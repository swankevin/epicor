import 'package:epicor/controller/ud01_controller.dart';
import 'package:epicor/model/ud01.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class UD01AddScreen extends StatelessWidget {
  const UD01AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(UD01Controller());
    Get.find<UD01Controller>().clearData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Item'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          TextField(
            controller: _controller.key1Controller,
            decoration:
                const InputDecoration(hintText: 'Enter ID', labelText: 'ID'),
          ),
          TextField(
            controller: _controller.char1Controller,
            decoration: const InputDecoration(
                hintText: 'Enter Name', labelText: 'Fullname'),
          ),
          SizedBox(height: 1),
          TextField(
            controller: _controller.char2Controller,
            decoration: const InputDecoration(
                hintText: 'Enter Address', labelText: 'Address'),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _controller.number1Controller,
            decoration: const InputDecoration(
                hintText: 'Enter Phone Number', labelText: "Phone"),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Get.find<UD01Controller>().addItem(UD01(
                  Key1: _controller.key1Controller.text,
                  Character01: _controller.char1Controller.text,
                  Character02: _controller.char2Controller.text,
                  Number01: _controller.number1Controller.text));
            },
            child: Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
