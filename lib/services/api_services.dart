import 'package:dio/dio.dart';

final Dio dio = Dio();
var itemList = [];

void getHttp() async {
  try {
    final response = await dio.get("https://fakestoreapi.com/products?limit=5");
    if (response.statusCode == 200) {
      itemList = List.from(response.data);
      print(response.data);
    } else {
      print(response.statusCode);
    }
  } catch (e) {
    print(e);
  }
}
