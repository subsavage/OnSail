import 'package:flutter/material.dart';

class WishList extends StatefulWidget {
  static const routeName = "/WishList";
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("WishList")),
    );
  }
}
