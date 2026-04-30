import 'package:flutter/material.dart';
import '../models/cart_model.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final cart = Cart();
  String endereco = "";
  String pagamento = "Dinheiro";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Endereço"),
              onChanged: (value) => endereco = value,
            ),

            const SizedBox(height: 20),

            DropdownButton<String>(
              value: pagamento,
              items: [
                "Dinheiro",
                "Cartão",
                "Pix",
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (value) {
                setState(() {
                  pagamento = value!;
                });
              },
            ),

            const SizedBox(height: 30),

            Text(
              "Total: R\$ ${cart.total.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (endereco.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Informe o endereço")),
                  );
                  return;
                }

                cart.limpar();

                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Pedido Confirmado"),
                    content: const Text("Seu pedido foi enviado!"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Confirmar Pedido"),
            ),
          ],
        ),
      ),
    );
  }
}
