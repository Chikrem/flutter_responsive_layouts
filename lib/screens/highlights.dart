import 'package:flutter/material.dart';
import 'package:flutter_responsive_layouts/cardapio.dart';
import 'package:flutter_responsive_layouts/components/highlight_item.dart';

class Highlights extends StatelessWidget {
  const Highlights({super.key});

  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: MediaQuery.of(context).orientation == Orientation.landscape ? gridView(items: items) : scrollView(items: items) ,
    );
  }
}

class scrollView extends StatelessWidget {
  const scrollView({
    super.key,
    required this.items,
  });

  final List items;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Text(
            "Destaques",
            style: TextStyle(fontFamily: "Caveat", fontSize: 32),
            textAlign: TextAlign.center,
          ),
        )),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return HighlightItem(
                imageURI: items[index]["image"],
                itemTitle: items[index]["name"],
                itemPrice: items[index]["price"],
                itemDescription: items[index]["description"]);
          },
          childCount: items.length,
        ))
      ],
    );
  }
}

class gridView extends StatelessWidget {
  const gridView({
    super.key,
    required this.items,
  });

  final List items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        return HighlightItem(
          imageURI: items[index]["image"],
          itemTitle: items[index]["name"],
          itemPrice: items[index]["price"],
          itemDescription: items[index]["description"],
        );
      },
      itemCount: items.length,
    );
  }
}
