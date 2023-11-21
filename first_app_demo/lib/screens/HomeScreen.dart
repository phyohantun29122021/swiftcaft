// home_screen.dart
import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Grid'),
      ),
      body: ProductGrid(),
    );
  }
}

class ProductGrid extends StatelessWidget {
  // Replace this list with your actual product data
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Hoodie',
      'price': 29.99,
      'imageUrl': 'lib/images/hoodie.jpg',
    },
    {
      'name': 'Sneaker',
      'price': 49.99,
      'imageUrl': 'lib/images/sneaker.jpg',
    },
    {
      'name': 'Sweater',
      'price': 29.99,
      'imageUrl': 'lib/images/sweater.jpg',
    },
    {
      'name': 'T-shirt',
      'price': 9.99,
      'imageUrl': 'lib/images/tshirt.jpg',
    },
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return ProductCard(
          productName: product['name'],
          productPrice:
              '\$${product['price'].toStringAsFixed(2)}', // Displaying price as a string
          productImage: product['imageUrl'],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
