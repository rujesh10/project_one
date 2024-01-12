import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_one/screens/add_images.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
                child: CircleAvatar(
              child: Text("Admin"),
              radius: 50,
            )),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Rujesh Shrestha",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Rujesh10@gmail.com",
              style: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.grey,
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddImage(),
                          ));
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.add,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Add Qr Code"),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
                Divider()
              ],
            )
          ],
        ),
      ),
    );
  }
}
