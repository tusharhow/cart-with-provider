import 'package:add_to_cart_demo/data/data.dart';
import 'package:add_to_cart_demo/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_count.dart';
import '../controllers/controller.dart';
import '../widgets/product_card.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 15, top: 8, bottom: 8),
              child: Stack(
                children: [
                  const Align(
                      alignment: Alignment.bottomCenter,
                      child: Icon(Icons.shopping_cart_rounded,
                          color: Colors.green, size: 25)),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Consumer<ProductsController>(
                      builder: (context, value, child) => CartCounter(
                        count: value.pList.length.toString(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        title: const Center(
          child: Text(
            "eVally",
            style: TextStyle(color: Colors.teal, fontSize: 25),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height * 0.90,
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: prds.length,
              itemBuilder: (context, index) => ProductCard(
                image: prds[index]["image"].toString(),
                itemName: prds[index]["name"].toString(),
                price: prds[index]["price"].toString(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
