import 'package:epicor/controller/ud01_controller.dart';
import 'package:epicor/model/ud01.dart';
import 'package:epicor/util/reusables.dart';
import 'package:epicor/view/ud01/ud01add_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class UD01Screen extends StatelessWidget {
  const UD01Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          ElevatedButton(
            onPressed: () {
              UD01Controller().clearData();
              Get.toNamed('/Add');
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: GetBuilder<UD01Controller>(
            init: UD01Controller(),
            builder: (controller) {
              return controller.isLoading
                  ? const CircularProgressIndicator()
                  : RefreshIndicator(
                      onRefresh: () => controller.getList(),
                      child: ListView.builder(
                        itemCount: controller.ud01s.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Card(
                              color:
                                  Theme.of(context).colorScheme.surfaceVariant,
                              child: Slidable(
                                endActionPane: ActionPane(
                                  extentRatio: 0.40,
                                  motion: ScrollMotion(),
                                  children: <Widget>[
                                    SlidableAction(
                                      onPressed: (context) {
                                        controller.passData(UD01(
                                            Key1: controller.ud01s[index].Key1,
                                            Character01: controller
                                                .ud01s[index].Character01,
                                            Character02: controller
                                                .ud01s[index].Character02,
                                            Number01: controller
                                                .ud01s[index].Number01));
                                        Get.toNamed(
                                          '/Edit',
                                        );
                                      },
                                      backgroundColor:
                                          Color.fromARGB(255, 20, 182, 114),
                                      foregroundColor: Colors.white,
                                      icon: Icons.edit,
                                      label: 'Edit',
                                    ),
                                    SlidableAction(
                                      onPressed: (context) {
                                        _confirmationBox(context,
                                            controller.ud01s[index].Key1);
                                      },
                                      backgroundColor: Color(0xFFFE4A49),
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                    ),
                                  ],
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: Colors.amber),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${controller.ud01s[index].Key1} - ${controller.ud01s[index].Character01}',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                                '${controller.ud01s[index].Character02} - ${controller.ud01s[index].Number01}'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
            }),
      ),
    );
  }

  void _confirmationBox(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete this row?'),
          content: Text(' This action cannot be undone!'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  //action code for "Yes" button
                  Navigator.pop(context);
                  Future.delayed(Duration(milliseconds: 300), () {
                    UD01Controller().deleteItem(id);
                  });
                },
                child: Text('Yes')),
            TextButton(
              onPressed: () {
                //action code for "No" button
                //Get.off(() => UD01Screen());
                Navigator.pop(context);
              },
              child: Text('No'),
            )
          ],
        );
      },
    );
  }

  void _confirmationBox2(BuildContext context) {
    Get.defaultDialog(
        title: "Delete this row?",
        middleText: "This action cannot be undone!",
        backgroundColor: Colors.green,
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
        textConfirm: "Confirm",
        textCancel: "Cancel",
        cancelTextColor: Colors.white,
        confirmTextColor: Colors.white,
        //buttonColor: Colors.red,
        barrierDismissible: false,
        radius: 50,
        content: Column(
          children: [
            // Container(child: Text("Hello 1")),
            // Container(child: Text("Hello 2")),
            // Container(child: Text("Hello 3")),
          ],
        ));
  }
}
