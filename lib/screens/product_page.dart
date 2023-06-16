import 'package:ecommece_app/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});
  static const routeName = 'product-page';
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments;
    final loadedProduct = Provider.of<Products>(context)
        .items
        .firstWhere((prod) => prod.id == productId);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_sharp),
      ),
      body: Column(
        children: [
          Container(
            child: Image.network(loadedProduct.imgUrl ?? ''),
          ),
        ],
      ),
    );
  }
}
