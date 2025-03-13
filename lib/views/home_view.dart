import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwan_app/controllers/todo_controler.dart';
import 'package:kwan_app/views/add_todo_view.dart';
import 'package:kwan_app/models/todo_model.dart'; // Add this line to import TodoModel



// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});

  TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Apirom Shop', style: TextStyle(color: Colors.black))),
        backgroundColor: Color(0xFF74948C),
      ),
      body: Obx(() {
        return Column(
          children: [
            Text("Shop", style: TextStyle(fontSize: 20)),
            Expanded(
              child: ListView.builder(
                itemCount: todoController.todoList.length,
                itemBuilder: (context, index) {
                  TodoModel todo = todoController.todoList[index];
                  return ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.description),
                    leading: Checkbox(
                      value: todo.isDone,
                      onChanged: (bool? newValue) {
                        todoController.toggelTodo(index);
                      },
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        todoController.todoList.removeAt(index);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddTodoView());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}