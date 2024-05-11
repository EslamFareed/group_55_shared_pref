import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/shared_helper.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: emailController),
            TextField(controller: passwordController),
            ElevatedButton(
              onPressed: () async {
                // var prefs = await SharedPreferences.getInstance();
                await SharedHelper.prefs!
                    .setString("email", emailController.text);
                await SharedHelper.prefs!
                    .setString("password", passwordController.text);

                await SharedHelper.prefs!.setBool("isLogin", true);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

//! 



 // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.deepOrange,
  //       centerTitle: true,
  //       title: const Text(
  //         "Login",
  //         style: TextStyle(color: Colors.white),
  //       ),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           TextField(controller: counterController),
  //           ElevatedButton(
  //             onPressed: () async {
  //               var prefs = await SharedPreferences.getInstance();
  //               await prefs.setInt(
  //                   "counter", int.parse(counterController.text));
  //               counterController.text = "";
  //             },
  //             child: const Text("Save Data"),
  //           ),
  //           ElevatedButton(
  //             onPressed: () async {
  //               var prefs = await SharedPreferences.getInstance();
  //               counterController.text = prefs.getInt("counter").toString();
  //             },
  //             child: const Text("Get Data"),
  //           ),
  //           ElevatedButton(
  //             onPressed: () async {
  //               var prefs = await SharedPreferences.getInstance();

  //               counterController.text = "";

  //               await prefs.remove("counter");
  //             },
  //             child: const Text("Delete Data"),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }