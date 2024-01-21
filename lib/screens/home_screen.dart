import 'package:flutter/material.dart';
import 'package:order_pizza/data/pizza_data.dart';
import 'package:order_pizza/screens/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.pizza,
  });

  final List<Pizza> pizza;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      extendBody: true,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu),
          ),
        ],
        shadowColor: Colors.black,
        elevation: 4,
        title: const Text('Pizza'),
        centerTitle: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: pizza.length,
        itemBuilder: (context, index) {
          var pizzaList = pizza[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailScreen(pizzaList: pizza[index]);
                  },
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 200,
              margin: const EdgeInsets.all(20),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  const BoxShadow(
                    spreadRadius: -10,
                    blurRadius: 10,
                    offset: Offset(10, 10),
                    color: Colors.black45,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.favorite_border_outlined),
                      Spacer(),
                      Text(
                        pizzaList.name,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Spacer(),
                      Text(
                        ' ${pizzaList.price}\$',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Hero(
                    tag: pizzaList,
                    child: Container(
                      width: 170,
                      height: 170,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(pizzaList.Image),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(90),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
