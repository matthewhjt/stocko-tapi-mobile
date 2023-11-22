class Product {
  String name;
  int amount;
  int price;
  String description;
  static List<Product> products = [];

  Product({
    required this.name,
    required this.amount,
    required this.price,
    required this.description,
  });
}
