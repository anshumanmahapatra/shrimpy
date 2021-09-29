import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller.dart';
import '../../screens/auth/login.dart';
import '../../screens/home/home.dart';

class PseudoHome extends StatelessWidget {
  const PseudoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    Login login = Get.put(const Login());
    Home home = Get.put(const Home());
    double height = Get.mediaQuery.size.height;
    double width = Get.mediaQuery.size.width;
    return FutureBuilder<bool>(
        future: authController.isUserLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == true) {
              return home;
            } else {
              return login;
            }
          } else if (snapshot.hasError) {
            return SizedBox(
                height: height,
                width: width,
                child: Center(
                  child: Text(snapshot.error.toString()),
                ));
          } else {
            return SizedBox(
                height: height,
                width: width,
                child: const Center(
                  child: CircularProgressIndicator(),
                ));
          }
        });
  }
}
