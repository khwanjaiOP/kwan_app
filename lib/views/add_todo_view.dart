import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwan_app/controllers/todo_controler.dart';


class AddTodoView extends StatelessWidget {
  AddTodoView({super.key});
  
  final TodoController todoControler = Get.put(TodoController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
        backgroundColor: Color(0xFF74948C),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Name"),
            TextField(
              controller: titleController,
            ),
            Text("Description"),
            TextField(
              controller: descriptionController,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              todoControler.addTodo(
                titleController.text,
                descriptionController.text,
              );
              Get.back();
              Get.snackbar("notification", "Add Success",
                  backgroundColor: Color(0xFF578088),
                  snackPosition: SnackPosition.BOTTOM);
            }, child: Text("Add"),style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFCFB580),
              textStyle: TextStyle(fontSize: 15),
            ),),
          ],
        ),
      ),
    );
  }
}