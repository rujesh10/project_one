import 'package:cloud_firestore/cloud_firestore.dart';

import 'api_services.dart';

class ApiImpl extends Api {
  @override
  saveQrData(
      {String? title, String? bName, String? tag, String? qrImage}) async {
    var response = {
      "title": title,
      "bName": bName,
      "tag": tag,
      "qrImage": qrImage
    };
    try {
      await FirebaseFirestore.instance.collection("QrCollection").add(response);
    } catch (e) {
      print(e);
    }
  }
}
