import 'package:coffee_api/appbarwidget.dart';
import 'package:coffee_api/features/coffee_detail/representation/viewmodel/cubit/button_cubit.dart';
import 'package:coffee_api/features/coffee_detail/representation/viewmodel/cubit/button_state.dart';
import 'package:coffee_api/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff2e582e),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("CheckOut",
            style: TextStyle(
              fontFamily: 'Parisienne',
              color: Colors.grey.shade500,
              fontSize: 30,
            )),
        centerTitle: true,
        actions: [AppBarWidget()],
      ),
      body: SizedBox(
        height: 550,
        child: BlocBuilder<ButtonCubit, ButtonState>(
          builder: (context, state) {
            List<Coffee> selectedCoffee =
                context.read<ButtonCubit>().selectedcoffee;

            if (selectedCoffee.isEmpty) {
              return Center(child: Text("No Products"));
            }

            return ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: selectedCoffee.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: selectedCoffee[index].imageUrl != null
                          ? NetworkImage(selectedCoffee[index].imageUrl!)
                          : NetworkImage(
                              'assets/images/placeholder.png'), // صورة بديلة
                    ),
                    title: Text("Item ${index + 1}"),
                    subtitle: Text(
                      "\$${selectedCoffee[index].price?.toStringAsFixed(2) ?? '0.00'}",
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<ButtonCubit>().removeItemAtIndex(index);
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
