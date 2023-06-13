import 'dart:convert';

class Product {
  final String id;
  final String title;
  final int rate;
  final String imgUrl;
  final String desc;

  Product(
    this.id,
    this.title,
    this.rate,
    this.imgUrl,
    this.desc,
  );

  Product copyWith({
    String? id,
    String? title,
    int? rate,
    String? imgUrl,
    String? desc,
  }) {
    return Product(
      id ?? this.id,
      title ?? this.title,
      rate ?? this.rate,
      imgUrl ?? this.imgUrl,
      desc ?? this.desc,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'rate': rate,
      'imgUrl': imgUrl,
      'desc': desc,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      map['id'] ?? '',
      map['title'] ?? '',
      map['rate']?.toInt() ?? 0,
      map['imgUrl'] ?? '',
      map['desc'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, title: $title, rate: $rate, imgUrl: $imgUrl, desc: $desc)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.title == title &&
        other.rate == rate &&
        other.imgUrl == imgUrl &&
        other.desc == desc;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        rate.hashCode ^
        imgUrl.hashCode ^
        desc.hashCode;
  }
}
