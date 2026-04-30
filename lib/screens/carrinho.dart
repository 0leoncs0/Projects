import 'package:flutter/material.dart';
import '../models/cart_model.dart';
import 'checkout.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cart = Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Carrinho")),
      body: cart.itens.isEmpty
          ? const Center(child: Text("Seu carrinho está vazio"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.itens.length,
                    itemBuilder: (context, index) {
                      final item = cart.itens[index];

                      return ListTile(
                        title: Text(item.pizza.nome),
                        subtitle: Text("Qtd: ${item.quantidade}"),
                        trailing: Text(
                          "R\$ ${(item.pizza.preco * item.quantidade).toStringAsFixed(2)}",
                        ),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        "Total: R\$ ${cart.total.toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CheckoutPage(),
                            ),
                          );
                        },
                        child: const Text("Finalizar Pedido"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
