import 'package:flutter/material.dart';
import '../models/pizza_model.dart';
import '../models/cart_model.dart';

class PizzaDetailPage extends StatefulWidget {
  final Pizza pizza;

  const PizzaDetailPage({super.key, required this.pizza});

  @override
  State<PizzaDetailPage> createState() => _PizzaDetailPageState();
}

class _PizzaDetailPageState extends State<PizzaDetailPage> {
  int quantidade = 1;

  bool extraQueijo = false;
  bool bordaRecheada = false;

  double get precoTotal {
    double preco = widget.pizza.preco;

    if (extraQueijo) preco += 5;
    if (bordaRecheada) preco += 8;

    return preco * quantidade;
  }

  @override
  Widget build(BuildContext context) {
    final isSalgada = widget.pizza.categoria == "Salgadas";
    return Scaffold(
      appBar: AppBar(title: Text(widget.pizza.nome)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // imagem
          Image.asset(
            widget.pizza.imagem,
            width: double.infinity,
            height: 220,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.local_pizza, size: 100),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              widget.pizza.nome,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(widget.pizza.descricao),
          ),

          const SizedBox(height: 20),

          // adicionais
          if (isSalgada) ...[
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                "Adicionais",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            CheckboxListTile(
              title: const Text("Extra queijo (+R\$5)"),
              value: extraQueijo,
              onChanged: (value) {
                setState(() {
                  extraQueijo = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text("Borda recheada (+R\$8)"),
              value: bordaRecheada,
              onChanged: (value) {
                setState(() {
                  bordaRecheada = value!;
                });
              },
            ),
          ],

          const Spacer(),

          // quantidade+total+botão
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 5),
              ],
            ),
            child: Column(
              children: [
                // quantidade
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (quantidade > 1) {
                          setState(() {
                            quantidade--;
                          });
                        }
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text(
                      quantidade.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          quantidade++;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // total
                Text(
                  "Total: R\$ ${precoTotal.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                // botão
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      for (int i = 0; i < quantidade; i++) {
                        Cart().adicionar(widget.pizza);
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "${widget.pizza.nome} adicionada ao carrinho",
                          ),
                        ),
                      );
                    },
                    child: const Text("Adicionar ao Carrinho"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
