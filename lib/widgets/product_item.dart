import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.screenSize,
    required this.image,
    required this.itemName,
    required this.price,
  }) : super(key: key);

  final Size screenSize;
  final String image, itemName, price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: screenSize.height * 0.15,
      width: screenSize.width / 1.1,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 3)
          ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            height: screenSize.height * 0.13,
            width: screenSize.width * 0.3,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            imageUrl: image,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                itemName,
                style: const TextStyle(fontSize: 22),
              ),
              Text(
                price,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
