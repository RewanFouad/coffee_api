abstract class ButtonState {}

class InitialState extends ButtonState {}

class RemoveState extends ButtonState {}

class AddState extends ButtonState {
  final int num;
  AddState(this.num);
}

class BuyState extends ButtonState {}
