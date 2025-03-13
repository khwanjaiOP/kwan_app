import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:kwan_app/controllers/auth_controller.dart';
import 'package:kwan_app/widgets/app_text_field.dart';

// ignore: must_be_immutable
class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Color(0xFF74948C),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // รูปภาพพร้อมมุมโค้ง
            ClipRRect(
              borderRadius: BorderRadius.circular(20), // ปรับค่าความโค้งที่นี่
              child: Image.network(
                'https://i.pinimg.com/736x/00/5e/07/005e07f09f324bedfeb55835edd78859.jpg', // เปลี่ยน URL เป็นรูปของคุณ
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            AppTextField(label: "Email" , controller: emailController,hideText: true,),
            SizedBox(height: 10),
            AppTextField(label: "Password" , controller: passwordController,hideText: true,),
            SizedBox(height: 10),
            AppTextField(label: "Confirm Password" , controller: confirmPasswordController,hideText: true,),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (!GetUtils.isEmail(emailController.text)) {
                  Get.snackbar("Error", "Invalid email");
                  return;
                }
                if (passwordController.text.length < 6){
                  Get.snackbar("Error", "Password must be at least 6 characters");
                  return;
                }
                if (passwordController.text != confirmPasswordController.text){
                  Get.snackbar("Error", "Password and Confirm Password must be the same");
                  return;
                }
                authController.register(
                  emailController.text, 
                  passwordController.text,
                  );
              },
              //logic register
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}