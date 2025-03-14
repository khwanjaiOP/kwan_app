import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:kwan_app/views/home_view.dart';
import 'package:kwan_app/views/login_view.dart';

class AuthController extends GetxController{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;


  var user = Rxn<User>();
  @override
  void onInit(){
    super.onInit();
    user.bindStream(firebaseAuth.authStateChanges());
  }

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
  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
      Get.snackbar("complete","Logout complete");
      Get.off(LoginView());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}