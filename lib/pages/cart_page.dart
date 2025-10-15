import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'cart_detail.dart';

import '../cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Cart> carts = [];
  bool isLoading = true;
  String? errorMessage;

  void initState() {
    super.initState();
    fetchCard();
  }

  Future<void> fetchCard() async {
    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/carts'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> rawData = json.decode(response.body);
        final List<Cart> parsedCarts = rawData.map((e) {
          return Cart.fromJson(e as Map<String, dynamic>);
        }).toList();

        setState(() {
          carts = parsedCarts;
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load User';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (errorMessage != null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: Center(child: Text(errorMessage!)),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text('Card')),
      body: ListView.builder(
        itemCount: carts.length,
        itemBuilder: (BuildContext context, int index) {
          final cart = carts[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text(cart.products.length.toString()),
              ),
              title: Text('Card ID: ${cart.id}'),
              subtitle: Text('User: ${cart.userId}'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartDetail(cart: cart),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
