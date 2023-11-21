import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ShoppingCartScreen.dart';

class ProductInfoScreen extends StatefulWidget {
  final String productName;
  final String productPrice;
  final String productImage;

  ProductInfoScreen({
    required this.productName,
    required this.productPrice,
    required this.productImage,
  });

  @override
  _ProductInfoScreenState createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  String selectedSize = 'Medium'; // Default size
  double selectedAmount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  widget.productImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Price: ${widget.productPrice}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Size: $selectedSize',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          sizeButton('Small'),
                          sizeButton('Medium'),
                          sizeButton('Large'),
                          sizeButton('XL'),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (selectedAmount > 1) {
                                selectedAmount--;
                              }
                            });
                          },
                        ),
                        Text(
                          selectedAmount.toInt().toString(),
                          style: TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              selectedAmount++;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Total Price: \$${calculateTotalPrice().toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Remove non-numeric characters from the product price
                String cleanPrice =
                    widget.productPrice.replaceAll(RegExp(r'[^\d.]'), '');

                // Create the product object
                Product product = Product(
                  name: widget.productName,
                  price: double.parse(cleanPrice),
                  size: selectedSize,
                  amount: selectedAmount,
                  image: widget.productImage,
                );

                // Add the product to the cart
                Provider.of<Cart>(context, listen: false).addToCart(product);

                // Show a snackbar or navigate to the cart screen
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Added to cart'),
                    backgroundColor: Colors.blue,
                  ),
                );
              },
              child: Text(
                'Add to Cart',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sizeButton(String size) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedSize = size;
          });
        },
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: size == selectedSize ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.blue,
              width: 1.5,
            ),
          ),
          child: Text(
            size,
            style: TextStyle(
              color: size == selectedSize ? Colors.white : Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  double calculateTotalPrice() {
    try {
      // Remove non-numeric characters from the product price
      String cleanPrice = widget.productPrice.replaceAll(RegExp(r'[^\d.]'), '');
      double price = double.parse(cleanPrice);
      return price * selectedAmount;
    } catch (e) {
      print('Error parsing product price: $e');
      // Handle the error, e.g., show an error message to the user
      return 0;
    }
  }
}
