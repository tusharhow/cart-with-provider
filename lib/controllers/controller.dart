import 'package:flutter/widgets.dart';
import '../models/product_model.dart';

class ProductsController with ChangeNotifier {
  List<ProductsModel> pList =<ProductsModel>[];

  addToCart(String image, String name,String price) {
    pList.add(ProductsModel(image: image, name: name, price: price,),);
    notifyListeners();
  }

  deleteProduct(int index) {
    pList.removeAt(index);
    notifyListeners();
  }

  getTotalPrice() {
    double total = 0;
    for (var i = 0; i < pList.length; i++) {
      total += double.parse(pList[i].price);
    }
    return total;
  }
}