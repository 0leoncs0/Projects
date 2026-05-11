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

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              item.pizza.imagem,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              errorBuilder: (_, _, _) =>
                                  const Icon(Icons.local_pizza),
                            ),
                          ),

                          title: Text(
                            item.pizza.nome,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),

                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Qtd: ${item.quantidade}"),

                              if (item.adicionais.isNotEmpty)
                                Text(
                                  "Adicionais: ${item.adicionais.join(", ")}",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 12,
                                  ),
                                ),
                            ],
                          ),

                          trailing: SizedBox(
                            width: 70,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "R\$ ${item.precoTotal.toStringAsFixed(2)}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        cart.itens.removeAt(index);
                                      });

                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text("Item removido"),
                                        ),
                                      );
                                    },

                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
