import 'package:flutter/material.dart';

class bottomBar extends StatelessWidget {
  const bottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 150,
              color: Colors.amber,
              child: const Center(child: Text("Wishlist")),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 50,
              width: 150,
              color: Colors.amber,
              child: const Center(child: Text("Order Now")),
            ),
          ],
        ),
      ),
    );
  }
}
