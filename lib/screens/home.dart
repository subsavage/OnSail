import 'package:ecommece_app/screens/favorites.dart';
import 'package:ecommece_app/screens/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/products_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<Products>(context, listen: false).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text("Favorites"),
                onTap: () {
                  Navigator.of(context).pushNamed(Favorites.routeName);
                },
              ),
              ListTile(
                title: Text("Wishlist"),
                onTap: () {
                  Navigator.of(context).pushNamed(WishList.routeName);
                },
              ),
            ],
          ),
        ),
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
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ProductsGrid(),
          ),
        ));
  }
}
