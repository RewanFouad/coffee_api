import 'package:coffee_api/appbarwidget.dart';
import 'package:coffee_api/features/coffee_detail/representation/view/widgets/buttonswidget.dart';
import 'package:coffee_api/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeDetail extends StatelessWidget {
  const CoffeeDetail({
    Key? key,
    required this.title,
    required this.image,
    required this.coffee,
  }) : super(key: key);

  final String title;
  final String image;
  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [AppBarWidget()]),
      backgroundColor: Color(0xff2e582e),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(
                  child: Image.network(
                    coffee.imageUrl ?? '-',
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            // Details Container
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffee.name ?? '-',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Weight
                    Row(
                      children: [
                        Text(
                          "Weight:",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '${coffee.weight ?? '-'} gm',
                          style: TextStyle(
                            color: Color(0xff2e582e),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),

                    Text(
                      "Flavor Profile:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: (coffee.flavorProfile ?? []).map((flavor) {
                        return Chip(
                          backgroundColor: Color(0xff2e582e),
                          label: Text(
                            flavor,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 15),

                    Text(
                      "Grind Options:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: (coffee.grindOption ?? []).map((grind) {
                        return Chip(
                          backgroundColor: Color(0xff2e582e),
                          label: Text(
                            grind,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 15),

                    Text(
                      "Description:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      coffee.description ?? '-',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),

                    SizedBox(height: 30),

                    Button(coffee: coffee)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
