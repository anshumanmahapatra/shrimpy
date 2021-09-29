import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shrimpy/services/auth/authentication.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Authentication authentication = Get.put(Authentication());
    double height = Get.mediaQuery.size.height;
    double width = Get.mediaQuery.size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          backgroundColor: Colors.blue,
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SizedBox(
          height: height,
          width: width,
          child: Center(
              child: ElevatedButton(
                  child: const Text("Sign Out"),
                  onPressed: () {
                    authentication.signOut();
                  })),
        ));
  }
}
