import 'package:flutter/material.dart';

class ShoeDetail extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imagePath;

  ShoeDetail({
    required this.title,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sneaker Shop',
          style: TextStyle(
            color: Color(0xFF2B2B2B),
            fontSize: 16,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
            height: 20,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Image.asset(
              imagePath,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            Text(
              price,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Main function and runApp call
void main() {
  runApp(MaterialApp(
    home: ShoeDetail(
      title: "Nike Air Max",
      description:
          "The Nike Air Max is a classic sneaker that offers style and comfort.",
      price: "\Rp.752.000",
      imagePath: "assets/shoes/shoes2.png",
    ),
  ));
}
