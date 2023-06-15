// import 'package:dio/dio.dart';
// import 'package:ecommece_app/models/product_models.dart';

// final Dio dio = Dio();
// List<Product> itemList = [];

// void getHttp() async {
//   try {
//     final response = await dio.get("https://fakestoreapi.com/products");
//     if (response.statusCode == 200) {
//       // itemList = (response.data as List<dynamic>)
//       //     .map((item) => Product.fromJson(item))
//       //     .toList();
//       // print(itemList);
//     } else {
//       print(response.statusCode);
//     }
//   } catch (e) {
//     print(e);
//   }
// }

import 'package:dio/dio.dart';

import '../models/product_models.dart';

Future<List<Product>> fetchProducts() async {
  final dio = Dio();
  final response = await dio.get('https://fakestoreapi.com/products');

  if (response.statusCode == 200) {
    final List<dynamic> data = response.data;
    return data
        .map((item) => Product(
              title: item['title'] as String?,
              desc: item['description'] as String?,
              price: (item['price'] as num?)?.toDouble(),
              imgUrl: item['image']
                  as String?, // Change 'imgUrl' to 'image' as per the API response
            ))
        .toList();
  } else {
    throw Exception('Failed to fetch products');
  }
}
