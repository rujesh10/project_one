import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_one/screens/login_screen.dart';
import 'package:project_one/utils/message.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isLoading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150, bottom: 30),
              child: Text(
                "SignUp",
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
                decoration: InputDecoration(
                    hintText: "Enter your email address",
                    label: Text("Email"),
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
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
                      signIn();
                    },
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text("Signup"))),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  //Toast message to show email already exists
  // showMessage() {
  //   Fluttertoast.showToast(
  //       msg: "Email already exists,try using a different email!",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 4,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 16.0);
  // }

  //SignIn function
  void signIn() {
    setState(() {
      isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      _auth
          .createUserWithEmailAndPassword(
              email: emailController.text.toString(),
              password: emailController.text.toString())
          .then((value) {
        setState(() {
          isLoading = false;
        });
      }).onError((error, stackTrace) {
        setState(() {
          isLoading = false;
        });
        // showMessage();
        Message().showMessage(error.toString());
      });
    }
  }
}
