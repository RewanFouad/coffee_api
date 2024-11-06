import 'package:coffee_api/models/model.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final Coffee selectedCoffee;

  SuccessHomeState(this.selectedCoffee);
}

class ErrorHomeState extends HomeState {
  final String errorMessage;

  ErrorHomeState(this.errorMessage);
}
