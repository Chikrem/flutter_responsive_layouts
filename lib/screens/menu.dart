import 'package:flutter/material.dart';
import 'package:flutter_responsive_layouts/cardapio.dart';
import 'package:flutter_responsive_layouts/components/food_item.dart';

class Menu extends StatelessWidget {
  
    Menu({super.key});

final List items = comidas;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(child: Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Text("Menu", textAlign: TextAlign.center, style: TextStyle(fontSize: 32, fontFamily: "Caveat"),),
          ),),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            return FoodItem(itemTitle: items[index]['name'], itemPrice: items[index]['price'], imageURI: items[index]['image']);
            }, childCount: items.length),
          )
        ],
      ),
    );
  }
}