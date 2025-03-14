import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwan_app/controllers/todo_controler.dart';
import 'package:kwan_app/models/todo_model.dart';

// ignore: must_be_immutable
class AddTodoView extends StatefulWidget {
  AddTodoView({super.key, this.todo});
  TodoModel? todo;

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  final TodoController todoController = Get.put(TodoController());

  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState(){
    super.initState();
    if (widget.todo != null){
      titleController.text = widget.todo!.title;
      descriptionController.text = widget.todo!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.todo != null ?"edit todo": "Add todo", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF677E61),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Name 🦊 ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: "Enter task name...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Description 🌻 ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Enter task description...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (titleController.text.isEmpty) return;
                      if (widget.todo != null) {
                        widget.todo!.title = titleController.text;
                        widget.todo!.description = descriptionController.text;
                        todoController.updateTodo(widget.todo!);
                      }else{
                        todoController.addTodo(
                          titleController.text, 
                          descriptionController.text,
                          );
                      }

                      todoController.addTodo(
                        titleController.text,
                        descriptionController.text,
                      );
                      Get.back();
                      Get.snackbar(
                        "Notification",
                        "Task added successfully!",
                        backgroundColor: Color(0xFF578088),
                        snackPosition: SnackPosition.BOTTOM,
                        colorText: Colors.white,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE9972D),
                      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("Add Task", style: TextStyle(color: Color(0xFF143829))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
