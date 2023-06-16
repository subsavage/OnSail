import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../screens/product_page.dart';
import '../widgets/product_tile.dart';

class productsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context, listen: false);

    return FutureBuilder<void>(
      future: productData.fetchAndSetProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('An error occurred!'));
        } else {
          return Consumer<Products>(
            builder: (context, productData, child) {
              final products = productData.items;
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        ProductPage.routeName,
                        arguments: product.id,
                      );
                    },
                    child: ProductTile(
                      id: product.id,
                      title: product.title,
                      desc: product.desc,
                      imgUrl: product.imgUrl,
                      rate: product.price,
                    ),
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
