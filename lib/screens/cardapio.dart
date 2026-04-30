import 'package:flutter/material.dart';
import '../models/pizza_model.dart'; // Verifique se o caminho está correto
import 'pizza_detail_page.dart';

class CardapioPage extends StatelessWidget {
  final String categoriaSelecionada;

  // O construtor agora exige a categoria
  const CardapioPage({super.key, required this.categoriaSelecionada});

  @override
  Widget build(BuildContext context) {
    // Lógica de filtragem:
    final listaFiltrada = menuPizzas.where((pizza) {
      if (categoriaSelecionada == "Todos") return true;
      return pizza.categoria == categoriaSelecionada;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoriaSelecionada == "Todos"
              ? "Nosso Cardápio"
              : "Categoria: $categoriaSelecionada",
        ),
      ),
      body: listaFiltrada.isEmpty
          ? const Center(child: Text("Nenhum item encontrado nesta categoria."))
          : ListView.builder(
              itemCount: listaFiltrada.length,
              itemBuilder: (context, index) {
                final pizza = listaFiltrada[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    isThreeLine: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PizzaDetailPage(pizza: pizza),
                        ),
                      );
                    },
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        pizza.imagem,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                              Icons.local_pizza,
                              size: 40,
                              color: Color(0xFFA41616),
                            ),
                      ),
                    ),
                    title: Text(
                      pizza.nome,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(pizza.descricao),

                    trailing: Text(
                      "R\$ ${pizza.preco.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }, // itemBuilder
            ),
    );
  }
}
