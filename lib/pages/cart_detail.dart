import 'package:flutter/material.dart';
import '../cart.dart'; 

class CartDetail extends StatelessWidget {
  final Cart cart;

  const CartDetail({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    final products = cart.products;

    return Scaffold(
      appBar: AppBar(title: Text('Cart ${cart.id} Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User ID: ${cart.userId}',
              style: const TextStyle(fontSize: 18),
            ),
            Text('Date: ${cart.date}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 15),
            const Text(
              'Products in Cart:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final productItem = products[index];
                  return ListTile(
                    leading: const Icon(Icons.shopping_bag_outlined),
                    title: Text('Product ID: ${productItem.productId}'),
                    trailing: Text(
                      'Quantity: ${productItem.quantity}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
