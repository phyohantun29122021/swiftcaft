import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: cart.products.isEmpty
          ? Center(child: Text('Your shopping cart is empty.'))
          : ListView.builder(
              itemCount: cart.products.length,
              itemBuilder: (context, index) {
                var product = cart.products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle:
                      Text('Size: ${product.size}, Amount: ${product.amount}'),
                  trailing: Text('\$${product.price.toStringAsFixed(2)}'),
                );
              },
            ),
    );
  }
}

class Cart with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  void addToCart(Product product) {
    _products.add(product);
    notifyListeners();
  }
}

class Product {
  final String name;
  final double price;
  final String size;
  final double amount;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.size,
    required this.amount,
    required this.image,
  });
}
