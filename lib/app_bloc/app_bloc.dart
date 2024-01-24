import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_one/app_api_services/api_impl.dart';
import 'package:project_one/app_bloc/app_state.dart';

import '../app_api_services/api_services.dart';
import 'app_event.dart';

class AppBloc extends Bloc {
  Api _apiService = ApiImpl();
  AppBloc() : super(AppInitialState()) {
    on<UploadQrEvent>((event, emit) async {
      var response = await _apiService.saveQrData(
          bName: event.bName,
          qrImage: event.qrImage,
          tag: event.tag,
          title: event.title);
      if (response != null) {
        emit(AppLoadedState(isSuccessfull: true));
      } else {
        emit(AppErrorState());
      }
    });
  }
}
