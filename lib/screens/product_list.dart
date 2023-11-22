import 'package:stocko_tapi_mobile/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:stocko_tapi_mobile/widgets/left_drawer.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> productList = Product.products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Product List',
            ),
          ),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: productList.length,
              itemBuilder: (BuildContext context, int index) {
                Product product = productList[index];
                return ListTile(
                  title: Text(
                    "Name: ${product.name}\nAmount: ${product.amount}\nPrice: ${product.price}\nDescription: ${product.description}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  tileColor: Colors.indigo,
                  leading: const Icon(
                    Icons.task,
                    color: Colors.white,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Colors.white,
              ),
            )));
  }
}
