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
        children: [
          // IMAGEM
          Container(
            width: double.infinity,
            height: 250,
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(widget.pizza.imagem, fit: BoxFit.contain),
            ),
          ),

          // CONTEÚDO
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    // NOME
                    Text(
                      widget.pizza.nome,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // DESCRIÇÃO
                    Text(
                      widget.pizza.descricao,
                      style: TextStyle(color: Colors.grey[600]),
                    ),

                    const SizedBox(height: 20),

                    // ADICIONAIS (se for salgada)
                    if (widget.pizza.categoria == "Salgadas") ...[
                      const Text(
                        "Adicionais",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
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
                  ],
                ),
              ),
            ),
          ),

          // BARRA INFERIOR (fixa)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // QUANTIDADE
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (quantidade > 1) {
                          setState(() => quantidade--);
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
                        setState(() => quantidade++);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // BOTÃO
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      Cart().adicionar(
                        CartItem(
                          pizza: widget.pizza,
                          quantidade: quantidade,

                          adicionais: [
                            if (extraQueijo) "Extra queijo",
                            if (bordaRecheada) "Borda recheada",
                          ],

                          precoTotal: precoTotal,
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "${widget.pizza.nome} adicionada ao carrinho",
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Adicionar • R\$ ${precoTotal.toStringAsFixed(2)}",
                    ),
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
