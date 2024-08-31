import 'dart:convert';

Sneaker sneakerFromJson(String str) => Sneaker.fromJson(json.decode(str));

class Sneaker {
  String id;
  String name;
  String category;
  String price;
  List<String> imageUrl;

  Sneaker({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
  });

  factory Sneaker.fromJson(Map<String, dynamic> json) => Sneaker(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        price: json["price"],
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
      );
}
