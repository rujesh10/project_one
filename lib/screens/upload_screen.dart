import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_crop/image_crop.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_one/app_bloc/app_bloc.dart';

import '../app_bloc/app_event.dart';

class UploadImages extends StatefulWidget {
  UploadImages({Key? key});

  @override
  State<UploadImages> createState() => _UploadImagesState();
}

class _UploadImagesState extends State<UploadImages> {
  final _formkey = GlobalKey<FormState>();

  String? title, bName, tag, qrImage;

  File _file = File("");

  File _sample = File("");

  File? cropimage;

  final cropKey = GlobalKey<CropState>();

  String? selectedImageName;

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
      return "Failed to upload image. Please try again.";
    }
  }

  pickImageFormGallery() async {
    var pickImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickImage != null) {
      var imagePath = File(pickImage.path);
      final sample = await ImageCrop.sampleImage(
        file: imagePath,
        preferredSize: context.size?.longestSide.ceil(),
      );
      setState(() {
        _sample = sample;
        _file = imagePath;
        selectedImageName = imagePath.path.split('/').last;
        qrImage = imagePath.path;
      });

      showCropUI();
    }
  }

  void showCropUI() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return cropImage();
      },
    );
  }

  void _submitData() {
    try {
      BlocProvider.of<AppBloc>(context).add(UploadQrEvent(
          bName: bName, qrImage: qrImage, tag: tag, title: title));
    } catch (e) {
      print(e);
    }
  }

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

        setState(() {
          cropimage = croppedFile;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Image cropped successfully"),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload QR Code"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field should not be empty!";
                  }
                },
                onChanged: (value) {
                  title = value;
                },
                decoration: const InputDecoration(
                  hintText: "Enter your title",
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field should not be empty";
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Select Bank Name',
                ),
                value: null,
                onChanged: (String? value) {
                  bName = value;
                },
                items: <String>[
                  'NIC Asia',
                  'DGI Prabhu',
                  'NIBL',
                  'Global',
                  'Other'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field should not be empty";
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Select a Tag',
                ),
                value: null,
                onChanged: (String? value) {
                  tag = value;
                },
                items: <String>['Work', 'Personal Use', 'Home', 'Other']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  pickImageFormGallery();
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 0.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.photo),
                          ),
                          const SizedBox(width: 8),
                          const Text("Upload your QR"),
                        ],
                      ),
                      if (selectedImageName != null)
                        Text(
                          "Selected Image: $selectedImageName",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _submitData();
                    cropedImage();
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
