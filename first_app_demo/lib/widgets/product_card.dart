// product_card.dart
import 'package:flutter/material.dart';
import '../screens/product_info_screen.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productImage;

  ProductCard({
    required this.productName,
    required this.productPrice,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductInfoScreen(
                    productName: productName,
                    productPrice: productPrice,
                    productImage: productImage,
                  ),
                ),
              );
            },
            child: Container(
              height: 130,
              width: double.infinity,
              child: Image.asset(
                productImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.ltr,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  productPrice,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
