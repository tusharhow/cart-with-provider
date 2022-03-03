import 'package:add_to_cart_demo/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Consumer<ProductsController>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          actions: [
            Consumer<ProductsController>(
              builder: (context, value, child) => Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Total Price: ${value.getTotalPrice()}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: value.pList.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.horizontal,
                        background: Container(
                          color: Colors.red,
                        ),
                        onDismissed: (direction) {
                          value.deleteProduct(index);
                        },
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CartItem(
                                screenSize: screenSize,
                                image: value.pList[index].image,
                                itemName: value.pList[index].name,
                                price: '\$${value.pList[index].price}',
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
