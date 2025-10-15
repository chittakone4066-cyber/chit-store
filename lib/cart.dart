class ProductItem {
  final int productId;
  final int quantity;

  const ProductItem({required this.productId, required this.quantity});

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      productId: json['productId'] as int,
      quantity: json['quantity'] as int,
    );
  }
}

class Cart {
  final int id;
  final DateTime date;
  final int userId;
  final List<ProductItem> products;

  const Cart({
    required this.id,
    required this.date,
    required this.userId,
    required this.products,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    final List<dynamic> productsList = json['products'] as List<dynamic>;
    final List<ProductItem> productItems = productsList
        .map((i) => ProductItem.fromJson(i as Map<String, dynamic>))
        .toList();

    return Cart(
      id: json['id'] as int,
      date: DateTime.parse(json['date'] as String),
      userId: json['userId'] as int,
      products: productItems,
    );
  }
}
