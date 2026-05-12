import 'package:flutter/material.dart';
import '../models/pizza_model.dart';
import '../models/cart_model.dart';

class TelaPromocaoTerca extends StatelessWidget {
  const TelaPromocaoTerca({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime hoje = DateTime.now();
    final bool isTerca = hoje.weekday == DateTime.tuesday;

    final List<Pizza> salgadas =
        menuPizzas.where((p) => p.categoria == 'Salgadas').toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Promoção de Terça!'),
        backgroundColor: const Color(0xFFA41616),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Banner informativo
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: const Color(0xFFA41616),
            child: Column(
              children: [
                const Text(
                  '30% OFF',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'em todas as pizzas salgadas',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isTerca ? Colors.green : Colors.white24,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    isTerca
                        ? '✅ Promoção ativa hoje!'
                        : '⏰ Válido toda terça-feira',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Lista de pizzas salgadas com preço promocional
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: salgadas.length,
              itemBuilder: (context, index) {
                final pizza = salgadas[index];
                final double precoPromocional = pizza.preco * 0.7;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        pizza.imagem,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: 60,
                          height: 60,
                          color: Colors.grey[200],
                          child: const Icon(Icons.local_pizza,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                    title: Text(
                      pizza.nome,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pizza.descricao,
                          style: const TextStyle(fontSize: 12),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              'R\$ ${pizza.preco.toStringAsFixed(2)}',
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'R\$ ${precoPromocional.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Color(0xFFA41616),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: isTerca
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFA41616),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              // Cria pizza promocional com preço já descontado
                              final pizzaPromocional = Pizza(
                                nome: '${pizza.nome} (Promoção Terça)',
                                descricao: pizza.descricao,
                                preco: precoPromocional,
                                imagem: pizza.imagem,
                                categoria: pizza.categoria,
                              );

                              Cart().adicionar(CartItem(
                                pizza: pizzaPromocional,
                                quantidade: 1,
                                adicionais: [],
                                precoTotal: precoPromocional,
                              ));

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${pizza.nome} adicionada com 30% OFF!',
                                  ),
                                  backgroundColor: Colors.green,
                                  action: SnackBarAction(
                                    label: 'Ver Carrinho',
                                    textColor: Colors.white,
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ),
                              );
                            },
                            child: const Text('Pedir'),
                          )
                        : const SizedBox.shrink(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}