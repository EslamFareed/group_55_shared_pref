import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/shared_helper.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String? email;
  // String? password;

  // @override
  // void initState() {
  //   setPrefs();
  //   super.initState();
  // }

  // void setPrefs() async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   email = SharedHelper.prefs!.getString("email");
  //   password = SharedHelper.prefs!.getString("password");
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Email : ${SharedHelper.prefs!.getString("email")}"),
            Text("Password : ${SharedHelper.prefs!.getString("password")}"),
            ElevatedButton.icon(
              label: const Text("Logout"),
              onPressed: () {
                SharedHelper.logout().then((value) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                });
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
      ),
    );
  }
}
