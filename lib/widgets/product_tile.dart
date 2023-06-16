import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final int? id;
  final String? title;
  final String? desc;
  final String? imgUrl;
  final double? rate;

  const ProductTile({
    Key? key,
    required this.id,
    required this.title,
    required this.desc,
    required this.imgUrl,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
          title: Text(
            title ?? '',
            textAlign: TextAlign.center,
          ),
          trailing: const Icon(Icons.list_alt_sharp),
        ),
        child: Image.network(
          imgUrl ?? '',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
