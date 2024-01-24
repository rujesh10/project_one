import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_crop/image_crop.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_one/screens/upload_screen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File _file = File("");
  File _sample = File("");
  File? cropimage;
  final cropKey = GlobalKey<CropState>();

  Future<String?> uploadImageToFirebaseStorage(File imageFile) async {
    try {
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference = FirebaseStorage.instance.ref().child(imageName);
      UploadTask uploadTask = reference.putFile(imageFile);
      TaskSnapshot storageTaskSnapshot = await uploadTask;
      String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Error uploading image to Firebase Storage: $e");
      return "Failed to upload image. Please try again."; // Return an error message
    }
  }

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
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => UploadImages(),
                      //     ));
                      pickImageFormGallery();
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

  // Modify the pickImageFormGallery function
  pickImageFormGallery() async {
    var pickImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickImage != null) {
      var imagePath = File(pickImage.path);
      print(imagePath);
      final sample = await ImageCrop.sampleImage(
        file: imagePath,
        preferredSize: context.size?.longestSide.ceil(),
      );
      setState(() {
        _sample = sample;
        _file = imagePath;
      });

      // Show the cropping UI after selecting the image
      showCropUI();
    }
  }

// Add a method to show the cropping UI
  void showCropUI() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return cropImage();
      },
    );
  }

// Modify the cropImage method to include the cropping UI
  Widget cropImage() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  cropedImage();
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.check,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Crop.file(
            _sample,
            key: cropKey,
          ),
        ),
      ],
    );
  }

// Modify the cropedImage method to handle cropping

  Future<void> cropedImage() async {
    final crop = cropKey.currentState;

    if (crop != null) {
      final scale = crop.scale;
      final area = crop.area;

      if (area != null) {
        final sampledFile = await ImageCrop.sampleImage(
          file: _file,
          preferredSize: (2000 / scale!).round(),
        );

        final croppedFile = await ImageCrop.cropImage(
          file: sampledFile,
          area: area,
        );

        // Upload cropped image to Firebase Storage
        String? downloadUrl = await uploadImageToFirebaseStorage(croppedFile);

        if (downloadUrl != null) {
          // Save download URL in Firestore collection
          await FirebaseFirestore.instance.collection("QrImages").add({
            "image_url": downloadUrl,
            // Add additional data if needed
          });

          setState(() {
            cropimage = croppedFile;
          });

          // Show a success message or navigate to the next screen if needed
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Image Uploaded Successfully"),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    }
  }
}
