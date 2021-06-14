import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';
import '../providers/product.dart';
import '../providers/products.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Products',
        ),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            Product product = productsData.items[index];

            return UserProductItem(
              product.title,
              product.imageUrl,
            );
          },
          separatorBuilder: (ctx, index) => Divider(),
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}
