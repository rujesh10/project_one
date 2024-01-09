import 'package:equatable/equatable.dart';

abstract class AppState {}

abstract class AppInitialState extends AppState {}

abstract class AppLoadingState extends AppState {}

abstract class AppLoadedState extends AppState {}

abstract class AppErrorState extends AppState {}
