import 'package:flutter/material.dart';
import 'package:otp_firebase_flutter/services/authServices.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("LOGIN / SIGN UP"),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(hintText: "Email...")),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(hintText: "Password...")),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width / 3,
                child: ElevatedButton(
                    onPressed: () {
                      final String email = emailController.text.trim();
                      final String password = passwordController.text.trim();
                      if (email.isEmpty) {
                        print("email is empty");
                      } else {
                        if (password.isEmpty) {
                          print("password is empty");
                        } else {
                          context.read<AuthService>().login(email, password);
                        }
                      }
                    },
                    child: const Text("LOG IN")),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width / 3,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () {
                      final String email = emailController.text.trim();
                      final String password = passwordController.text.trim();
                      if (email.isEmpty) {
                        print("email is empty");
                      } else {
                        if (password.isEmpty) {
                          print("password is empty");
                        } else {
                          context.read<AuthService>().signup(email, password);
                        }
                      }
                    },
                    child: const Text("SIGN UP")),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
