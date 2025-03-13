import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:kwan_app/views/home_view.dart';

class AuthController extends GetxController{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> register(String email,String password) async{
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password,
        );Get.snackbar("complete","Register complete");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> login(String email,String password) async{
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password,
        );Get.snackbar("complete","Login complete");
        Get.to(HomeView());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}