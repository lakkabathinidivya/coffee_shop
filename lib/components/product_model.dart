class Product {
  final String image;
  final String title;
  final String description;
  final double price;
  final double rating;
  String cupSize;
  int quantity;
  double total;
  final int id;

  Product(
      {required this.image,
      required this.title,
      required this.rating,
      required this.id,
      this.quantity = 0,
      this.total = 0,
      required this.cupSize,
      required this.description,
      required this.price});
}
