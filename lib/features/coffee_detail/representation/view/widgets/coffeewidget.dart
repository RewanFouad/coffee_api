import 'package:coffee_api/features/coffee_detail/representation/view/coffeedetail.dart';
import 'package:coffee_api/features/coffee_detail/representation/viewmodel/cubit/button_state.dart';
import 'package:coffee_api/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../viewmodel/cubit/button_cubit.dart';

Widget coffeeDetail({
  required BuildContext context,
  required String title,
  required String image,
  required String price,
  required Coffee coffee,
  required String region,
}) {
  final containerWidth = (MediaQuery.of(context).size.width / 2) - 10;

  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return CoffeeDetail(
          title: title,
          image: image,
          coffee: coffee,
        );
      }));
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // Image Container
          Container(
            width: containerWidth,
            height: 150,
            decoration: BoxDecoration(
              color: Color(0xff2e582e),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 5),
          // Details Container
          Container(
            width: containerWidth,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(height: 2),
                Text(
                  region,
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "\$",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(width: 2),
                        Text(
                          price,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 40),
                        BlocBuilder<ButtonCubit, ButtonState>(
                            builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              context.read<ButtonCubit>().add(coffee);
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xff2e582e),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
