class Pizza {
  final double price;
  final String name;
  final String Image;

  Pizza({required this.price, required this.name, required this.Image});
  static final List<Pizza> pizza = [
    Pizza(price: 7.53, name: 'American', Image: 'assets/images/pizza1.png'),
    Pizza(price: 9.99, name: 'Italian', Image: 'assets/images/pizza1.png'),
    Pizza(price: 8, name: 'Chilli', Image: 'assets/images/pizza2.png'),
  ];
}
