import 'package:flutter/material.dart';
import 'package:flutter_responsive_layouts/cardapio.dart';
import 'package:flutter_responsive_layouts/components/main_drawer.dart';
import 'package:flutter_responsive_layouts/components/order_item.dart';
import 'package:flutter_responsive_layouts/components/payment_method.dart';
import 'package:flutter_responsive_layouts/components/payment_total.dart';

class Checkout extends StatelessWidget {
  Checkout({super.key});

  final List items = pedido;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Finalizar Pedido"),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  "Pedido",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Caveat"),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                return OrderItem(
                    imageURI: items[index]['image'],
                    itemTitle: items[index]['name'],
                    itemPrice: items[index]['price']);
              },
              childCount: items.length,
            )),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top:16, bottom: 16),
                child: Text(
                  "Pagamento",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Caveat"),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: PaymentMethod()),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top:16, bottom: 16),
                child: Text(
                  "Confirmar",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Caveat"),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: PaymentTotal()),
          ],
        ),
      ),
    );
  }
}
