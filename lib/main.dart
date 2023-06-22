import 'package:ecommece_app/screens/favorites.dart';
import 'package:ecommece_app/screens/home.dart';
import 'package:ecommece_app/screens/product_page.dart';
import 'package:ecommece_app/screens/wishlist.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import './providers/products_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(useMaterial3: true),
        home: const HomePage(),
        routes: {
          ProductPage.routeName: (context) => const ProductPage(),
          Favorites.routeName: (context) => const Favorites(),
          WishList.routeName: (context) => const WishList(),
        },
      ),
    );
  }
}
