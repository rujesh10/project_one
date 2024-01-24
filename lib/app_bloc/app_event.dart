import 'package:equatable/equatable.dart';

abstract class AppEvent {}

class SignUpEvent extends AppEvent {

}

class UploadQrEvent extends AppEvent {
  String? title, bName, tag, qrImage;

  UploadQrEvent({this.title, this.bName, this.tag, this.qrImage});
}
