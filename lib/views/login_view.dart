import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwan_app/controllers/auth_controller.dart';
import 'package:kwan_app/widgets/app_text_field.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthController authController = Get.put(AuthController());

  Color buttonColor = Color(0xFFDA983C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login", style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFF74948C),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20), // ปรับค่าความโค้งที่นี่
              child: Image.network(
                'https://i.pinimg.com/736x/00/5e/07/005e07f09f324bedfeb55835edd78859.jpg', // เปลี่ยน URL เป็นรูปของคุณ
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            AppTextField(label: "Email", controller: emailController),
            SizedBox(height: 10),
            AppTextField(label: "Password", controller: passwordController, hideText: true),
            SizedBox(height: 10),
            MouseRegion(
              child: ElevatedButton(
                onPressed: () {
                  if (!GetUtils.isEmail(emailController.text)) {
                    Get.snackbar("Error", "Enter a valid email");
                    return;
                  }
                  if (passwordController.text.length < 6) {
                    Get.snackbar("Error", "Enter Password");
                    return;
                  }
                  authController.login(emailController.text, passwordController.text);
                },
                
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ), // ปิด MouseRegion ตรงนี้
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Get.to('RegisterView');
              },
              child: Text.rich(
                TextSpan(
                  text: "Don't have an account? ", // ฟอนต์ธรรมดา
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none, // ไม่มีเส้นขีดใต้
                  ),
                  children: [
                    TextSpan(
                      text: "Sign up", // ทำให้คำนี้หนาขึ้น
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline, // เส้นขีดใต้
                        fontWeight: FontWeight.bold, // ทำให้ข้อความหนาขึ้น
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
