import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_one/screens/home_screen.dart';
import 'package:project_one/screens/signup_screen.dart';
import 'package:project_one/utils/message.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final user = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Padding(
                padding: const EdgeInsets.only(top: 150, bottom: 30),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password should not be empty";
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration: const InputDecoration(
                      hintText: "Enter your email address",
                      label: Text("Email"),
                      border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password should not be empty";
                    }
                    return null;
                  },
                  controller: passwordController,
                  decoration: const InputDecoration(
                      hintText: "Enter your password",
                      label: Text("Password"),
                      border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 40,
                  width: 345,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _auth
                              .signInWithEmailAndPassword(
                                  email: emailController.text.toString(),
                                  password: passwordController.text.toString())
                              .then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ));
                          }).onError((error, stackTrace) {
                            Message().showMessage(error.toString());
                          });
                        }
                      },
                      child: const Text("Login"))),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ));
                      },
                      child: const Text(
                        "Signup",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
