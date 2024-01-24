import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_one/screens/display_images.dart';
import '../models/model.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  Future<List<ImageModel>> fetchImages() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("QrImages").get();

      List<ImageModel> images = querySnapshot.docs
          .map((doc) => ImageModel(imageUrl: doc["image_url"] ?? ""))
          .toList();

      return images;
    } catch (e) {
      print("Error fetching images: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Qr Wallet'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: FutureBuilder(
                future: fetchImages(),
                builder: (context, AsyncSnapshot<List<ImageModel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else {
                    List<ImageModel> images = snapshot.data ?? [];
                    if (images.isEmpty) {
                      return Center(
                        child: Text(
                          "No images available",
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    } else {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: images.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DisplayImages(
                                    herotag: "thisTag",
                                    imageUrl: images[index].imageUrl,
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Hero(
                                tag: "thisTag",
                                child: Image.network(images[index].imageUrl),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
