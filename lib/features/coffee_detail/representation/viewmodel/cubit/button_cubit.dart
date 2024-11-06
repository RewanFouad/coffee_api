import 'package:coffee_api/features/coffee_detail/representation/viewmodel/cubit/button_state.dart';
import 'package:coffee_api/models/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCubit extends Cubit<ButtonState> {
  int num = 0;
  double totalprice = 0;
  List<Coffee> selectedcoffee = [];
  int buy = 0;
  ButtonCubit() : super(InitialState());

  void resetNum() {
    num = 0;
    emit(AddState(num));
  }

  void add(Coffee coffee) {
    num++;
    totalprice += coffee.price ?? 0;
    selectedcoffee.add(coffee);
    emit(AddState(num));
  }

  void removeItemAtIndex(int index) {
    if (index >= 0 && index < selectedcoffee.length) {
      Coffee coffee = selectedcoffee[index];
      num--;
      totalprice -= coffee.price ?? 0;
      if (totalprice < 0) totalprice = 0;
      selectedcoffee.removeAt(index);
      emit(RemoveState());
    }
  }

  void buyNow(Coffee coffee) {
    num++;
    totalprice += coffee.price ?? 0;
    selectedcoffee.add(coffee);
    emit(AddState(num));
  }
}
