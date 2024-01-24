import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class DisplayImages extends StatefulWidget {
  final String herotag;
  final String imageUrl;

  DisplayImages({Key? key, required this.herotag, required this.imageUrl})
      : super(key: key);

  @override
  State<DisplayImages> createState() => _DisplayImagesState();
}

class _DisplayImagesState extends State<DisplayImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      size: 30,
                    )),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Hero(
                tag: widget.herotag,
                child: Image.network(widget.imageUrl),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  String url = widget.imageUrl;
                  final tempDir = await getTemporaryDirectory();
                  final path = '${tempDir.path}/myfile.jpg';
                  await Dio().download(url, path);
                  await GallerySaver.saveImage(path);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text("Downloaded Successfully"),
                    ),
                  );
                } catch (e) {
                  print("Error downloading or saving image: $e");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Failed to download image"),
                    ),
                  );
                }
              },
              child: Text("Download"),
            )
          ],
        ),
      ),
    );
  }
}
