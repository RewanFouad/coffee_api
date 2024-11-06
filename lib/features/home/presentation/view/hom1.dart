import 'package:coffee_api/appbarwidget.dart';
import 'package:coffee_api/features/auth/representation/view/signin.dart';
import 'package:coffee_api/features/coffee_detail/representation/view/widgets/coffeewidget.dart';
import 'package:coffee_api/features/coffee_detail/representation/viewmodel/cubit/button_cubit.dart';
import 'package:coffee_api/features/coffee_detail/representation/viewmodel/cubit/button_state.dart';
import 'package:coffee_api/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:coffee_api/features/home/presentation/viewmodel/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHttp(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              },
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xff2e582e),
              )),
          title: Text(
            "Coffee Shop",
            style: TextStyle(
              fontFamily: 'Parisienne',
              color: Colors.grey.shade500,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: AppBarWidget(),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is LoadingHomeState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SuccessHomeState) {
              final coffeeList = context.read<HomeCubit>().coffeeList;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Good Morning Bestie!",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 25,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: .6,
                        ),
                        itemCount: coffeeList.length,
                        itemBuilder: (context, index) {
                          final coffeeItem = coffeeList[index];
                          return coffeeDetail(
                            context: context,
                            title: coffeeItem.name ?? '_',
                            image: coffeeItem.imageUrl ?? '_',
                            price: coffeeItem.price.toString() ?? '-',
                            region: coffeeItem.region ?? '_',
                            coffee: coffeeItem,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ErrorHomeState) {
              return Center(
                child: Text('Failed to load coffee items'),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
