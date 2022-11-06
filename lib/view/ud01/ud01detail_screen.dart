import 'package:epicor/controller/ud01_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UD01DetailScreen extends StatelessWidget {
  const UD01DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(UD01Controller());
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
        ],
      ),
    );
  }
}
