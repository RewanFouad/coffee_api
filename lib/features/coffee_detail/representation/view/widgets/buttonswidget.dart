import 'package:coffee_api/features/coffee_detail/representation/viewmodel/cubit/button_cubit.dart';
import 'package:coffee_api/features/coffee_detail/representation/viewmodel/cubit/button_state.dart';
import 'package:coffee_api/models/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Button extends StatelessWidget {
  Button({Key? key, required this.coffee}) : super(key: key);
  final Coffee coffee;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonCubit, ButtonState>(builder: (context, state) {
      return Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff2e582e),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            context.read<ButtonCubit>().buyNow(coffee);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '\$${coffee.price ?? '-'}',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(width: 15),
              VerticalDivider(color: Colors.white, thickness: 1),
              SizedBox(width: 15),
              Text(
                "Add To Cart",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
