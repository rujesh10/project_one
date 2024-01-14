import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:project_one/screens/profile.dart';
import 'package:project_one/screens/scanner.dart';
import 'package:project_one/screens/wallet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Animate(
                          effects: const [FadeEffect(), SlideEffect()],
                          child: const Text(
                            "Welcome",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                fontFamily: 'Jost'),
                          ),
                        ),
                        Animate(
                          effects: const [FadeEffect(), SlideEffect()],
                          child: const Text(
                            "to Qr Wallet",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Jost'),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 110,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Profile(),
                            ));
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage("assets/images/profile.jpg"),
                        radius: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: const EdgeInsets.all(12.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScanQr(),
                          ));
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 30,
                          ),
                          CircleAvatar(
                            // backgroundColor: Colors.purple,
                            child: Icon(Icons.qr_code),
                            radius: 30,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "SCAN",
                            style: TextStyle(
                                fontFamily: "Heebo",
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Wallet(),
                          ));
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 30,
                          ),
                          CircleAvatar(
                            // backgroundColor: Colors.purple,
                            child: Icon(Icons.wallet),
                            radius: 30,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "MY WALLET",
                            style: TextStyle(
                                fontFamily: "Heebo",
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 30,
                        ),
                        CircleAvatar(
                          // backgroundColor: Colors.purple,
                          child: Icon(Icons.mail),
                          radius: 30,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "CONTACT",
                          style: TextStyle(
                              fontFamily: "Heebo", fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 30,
                        ),
                        CircleAvatar(
                          // backgroundColor: Colors.purple,
                          child: Icon(Icons.share),
                          radius: 30,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "SHARE",
                          style: TextStyle(
                              fontFamily: "Heebo", fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "@ 2024 Nepal,Inc. All rights reserved ",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
