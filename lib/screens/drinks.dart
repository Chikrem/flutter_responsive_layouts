import 'package:flutter/material.dart';
import 'package:flutter_responsive_layouts/cardapio.dart';
import 'package:flutter_responsive_layouts/components/drink_item.dart';

class Bebidas extends StatelessWidget {
  Bebidas({super.key});

  final List items = drinks;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: MediaQuery.of(context).orientation == Orientation.landscape ? 1.2 : 1,
      ),
      itemBuilder: (context, index) {
        return DrinkItem(
          imageURI: items[index]["image"],
          itemTitle: items[index]["name"],
          itemPrice: items[index]["price"],
        );
      },
      itemCount: items.length,
    );
  }
}
