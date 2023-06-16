class Product {
  final int? id;
  final String? title;
  final String? desc;
  final double? price;
  final String? imgUrl;
  bool isFavourite = false;

  Product({
    required this.id,
    required this.title,
    required this.desc,
    required this.price,
    required this.imgUrl,
  });
}
