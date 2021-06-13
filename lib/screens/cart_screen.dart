import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;
import '../providers/cart.dart';
import '../widgets/cart_item.dart' as ci;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color:
                            Theme.of(context).primaryTextTheme.headline6.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                        cart.items.values.toList(),
                        cart.totalAmount,
                      );
                      cart.clearCart();
                    },
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor),
                    child: Text(
                      'ORDER NOW',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              /// cart.items refers to a map and we are interested in the values on
              /// the map so we access them using '.values.toList()'
              CartItem cartItem = cart.items.values.toList()[index];
              final key = cart.items.keys.toList()[index];

              return ci.CartItem(
                cartItem.id,
                key,
                cartItem.price,
                cartItem.quantity,
                cartItem.title,
              );
            },
            itemCount: cart.itemCount,
          ))
        ],
      ),
    );
  }
}
