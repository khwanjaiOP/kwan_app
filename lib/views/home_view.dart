import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwan_app/controllers/auth_controller.dart';
import 'package:kwan_app/controllers/todo_controler.dart';
import 'package:kwan_app/views/add_todo_view.dart';
import 'package:kwan_app/models/todo_model.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});

  TodoController todoController = Get.put(TodoController());
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white, // White background for the box
              borderRadius: BorderRadius.circular(15), // Rounded corners
            ),
            child: Text(
              'Apirom Shop',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              todoController.todoList.clear();
              authController.logout();
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://i.pinimg.com/736x/ae/fa/38/aefa384220f672ce300152afa8ee2ca1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://i.pinimg.com/736x/ae/fa/38/aefa384220f672ce300152afa8ee2ca1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Obx(() {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "🍵",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  itemCount: todoController.todoList.length,
                  itemBuilder: (context, index) {
                    TodoModel todo = todoController.todoList[index];
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                "https://i.pinimg.com/736x/85/5f/b1/855fb108bd2fb61b200adda1b52fd67e.jpg",
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 40),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    todo.title,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    todo.description,
                                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 12),
                            GestureDetector(
                              onTap: () {
                                Get.to(AddTodoView(todo: todo));
                              },
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: todo.isDone,
                                    onChanged: (bool? newValue) {
                                      todoController.toggelTodo(index);
                                    },
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      todoController.removeTodo(todo.docId??'');
                                    },
                                    icon: Icon(Icons.delete, color: Color(0xFF67191F)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddTodoView());
        },
        backgroundColor: Color(0xFFDA983C),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
