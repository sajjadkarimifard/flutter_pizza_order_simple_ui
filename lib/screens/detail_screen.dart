import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:order_pizza/data/pizza_data.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.pizzaList});
  final Pizza pizzaList;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final controller = FadeInController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detail'),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FadeIn(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeIn,
                    child: Text(
                      '',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  FadeIn(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeIn,
                    child: Text(
                      'test',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PizzaSize(),
                  SizedBox(height: 40),
                  _HeroObject(widget: widget),
                  SizedBox(height: 40),
                  _CountWidget(),
                ],
              ),
            ],
          ),
          _orderButton(),
        ],
      ),
    );
  }
}

class _orderButton extends StatelessWidget {
  const _orderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      margin: EdgeInsets.all(20),
      child: Center(
        child: Text(
          'order your pizza',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.greenAccent.shade700,
        boxShadow: [
          const BoxShadow(
            spreadRadius: -10,
            blurRadius: 10,
            offset: Offset(10, 10),
            color: Colors.black45,
          ),
        ],
      ),
    );
  }
}

class _CountWidget extends StatelessWidget {
  const _CountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      width: 150,
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.shade300,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 48,
            width: 48,
            padding: EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/minus.png',
              color: Colors.white,
            ),
          ),
          Text('1'),
          Container(
            height: 48,
            width: 48,
            padding: EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/plus.png',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroObject extends StatelessWidget {
  const _HeroObject({
    super.key,
    required this.widget,
  });

  final DetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 196,
      width: 196,
      decoration: BoxDecoration(
        boxShadow: [
          const BoxShadow(
            spreadRadius: -20,
            blurRadius: 40,
            offset: Offset(-30, 20),
            color: Colors.black45,
          ),
        ],
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Hero(
          tag: widget.pizzaList,
          child: Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.pizzaList.Image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(90),
            ),
          ),
        ),
      ),
    );
  }
}

class PizzaSize extends StatefulWidget {
  const PizzaSize({super.key});

  @override
  State<PizzaSize> createState() => _PizzaSizeState();
}

class _PizzaSizeState extends State<PizzaSize> {
  int correctIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: size.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                correctIndex = index;
              });
            },
            child: Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: (index == correctIndex)
                      ? Colors.white
                      : Colors.transparent,
                  strokeAlign: BorderSide.strokeAlignInside,
                  width: (index == correctIndex) ? 2 : 0,
                ),
              ),
              child: Center(
                child: Text(
                  size[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<String> size = ['S', 'M', 'L'];
