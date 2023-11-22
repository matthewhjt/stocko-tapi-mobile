import 'package:flutter/material.dart';
import 'package:stocko_tapi_mobile/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Product Detail",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                product.fields.name,
                style: const TextStyle(color: Colors.black, fontSize: 50),
              ),
              const SizedBox(height: 10),
              Text(
                "Amount: ${product.fields.amount}",
                style: const TextStyle(color: Colors.black, fontSize: 30),
              ),
              const SizedBox(height: 10),
              Text(
                "Price: ${product.fields.price}",
                style: const TextStyle(color: Colors.black, fontSize: 30),
              ),
              const SizedBox(height: 10),
              Text(
                "Description: ${product.fields.description}",
                style: const TextStyle(color: Colors.black, fontSize: 30),
              ),
            ],
          ),
        ));
  }
}
