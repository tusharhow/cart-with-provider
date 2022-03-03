class ProductsModel {
  ProductsModel({
    required this.name,
    required this.image,
    required this.price,
  });

  String name;
  String image;
  String price;

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "price": price,
      };
}
