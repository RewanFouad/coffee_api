import 'package:coffee_api/features/coffee_detail/representation/viewmodel/cubit/button_cubit.dart';
import 'package:coffee_api/features/coffee_detail/representation/viewmodel/cubit/button_state.dart';
import 'package:coffee_api/features/shopping_cart/representation/view/shopping_cart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            BlocBuilder<ButtonCubit, ButtonState>(
              builder: (context, state) {
                int num = 0;
                if (state is AddState) {
                  num = state.num;
                }
                return Positioned(
                  bottom: 15,
                  child: Container(
                    child: Text(
                      "$num",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                  ),
                );
              },
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShoppingCart()),
                );
              },
              icon: Icon(
                Icons.add_shopping_cart,
                size: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
        BlocBuilder<ButtonCubit, ButtonState>(
          builder: (context, state) {
            double totalPrice = context.read<ButtonCubit>().totalprice;
            return Text(
              "\$ ${totalPrice.toStringAsFixed(2)}",
              style: TextStyle(color: Colors.black),
            );
          },
        ),
      ],
    );
  }
}
