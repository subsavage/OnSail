import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../screens/product_page.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = productData.items;
    final favorites = productData.favorites;
    final wishlist = productData.wishlist;

    return GridView.builder(
      padding: const EdgeInsets.all(2),
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                leading: IconButton(
                  onPressed: () {
                    if (!favorites.contains(product)) {
                      productData.addToFavorites(product);
                    } else {
                      productData.removeFromFavorites(product);
                    }
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: favorites.contains(product)
                        ? Colors.pink
                        : Colors.white,
                  ),
                ),
                title: Text(
                  product.title ?? '',
                  textAlign: TextAlign.center,
                ),
                trailing: IconButton(
                  onPressed: () {
                    if (!wishlist.contains(product)) {
                      productData.addToWishList(product);
                    } else {
                      productData.removeFromWishList(product);
                    }
                  },
                  icon: Icon(
                    Icons.list_alt_sharp,
                    color: wishlist.contains(product)
                        ? Colors.yellow
                        : Colors.white,
                  ),
                ),
              ),
              child: Image.network(
                product.imgUrl ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
