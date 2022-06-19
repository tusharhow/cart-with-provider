import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/controller.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
      required this.image,
      required this.price,
      required this.itemName})
      : super(key: key);

  final String image, itemName;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.5,
        width: MediaQuery.of(context).size.width * 0.3,
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
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                height: MediaQuery.of(context).size.height * 0.17,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                imageUrl: image,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(itemName, style: const TextStyle(fontSize: 22)),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("\$$price", style: const TextStyle(fontSize: 18)),
            ),
            Consumer<ProductsController>(
              builder: (context, value, child) => InkWell(
                onTap: () {
                  value.addToCart(image, itemName, price);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.teal,
                      ),
                      child: const Center(
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
