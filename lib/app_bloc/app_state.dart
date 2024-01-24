import 'package:equatable/equatable.dart';

abstract class AppState {}

class AppInitialState extends AppState {}

class AppLoadingState extends AppState {}

class AppLoadedState extends AppState {
  final bool? isSuccessfull;
  AppLoadedState({required this.isSuccessfull});
}

class AppErrorState extends AppState {}
