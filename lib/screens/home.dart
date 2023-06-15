import 'package:ecommece_app/models/product_models.dart';
import 'package:ecommece_app/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:ecommece_app/services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Product>> futureProducts = fetchProducts();
  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecommerce"),
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.person,
            ),
          )
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Product>>(
          future: futureProducts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final products = snapshot.data!;
              return GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 5,
                  crossAxisSpacing: 4,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductTile(
                    title: product.title,
                    desc: product.desc,
                    imgUrl: product.imgUrl,
                    rate: product.price,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
