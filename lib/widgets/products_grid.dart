import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import 'product_item.dart';
import '../providers/product.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ), 
      itemBuilder: (context, index) {
        Product product = products[index];

        /// It is important to use .value when lists and grids are
        /// involved.
        return ChangeNotifierProvider.value(
          value: product,
          child: ProductItem(),
        );
      },
      itemCount: products.length,
    );
  }
}