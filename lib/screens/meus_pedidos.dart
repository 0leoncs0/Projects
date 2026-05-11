import 'package:flutter/material.dart';
import '../models/pedidos_manager.dart';

class MeusPedidosPage extends StatelessWidget {
  const MeusPedidosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pedidos = PedidosManager().pedidos;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Pedidos"),
      ),

      body: pedidos.isEmpty
    ? const Center(
        child: Text(
          "Nenhum pedido realizado",
          style: TextStyle(fontSize: 16),
        ),
      )
    : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: pedidos.length,

        itemBuilder: (context, index) {
          final pedido = pedidos[index];

          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 16),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),

            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  // TOPO
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        "Pedido #${index + 1}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.15),

                          borderRadius:
                              BorderRadius.circular(20),
                        ),

                        child: const Row(
                          children: [
                            Icon(
                              Icons.local_pizza,
                              size: 18,
                              color: Colors.orange,
                            ),

                            SizedBox(width: 6),

                            Text(
                              "Em preparo",
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // ITENS
                  const Text(
                    "Itens do pedido",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  ...pedido.itens.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: 6,
                      ),

                      child: Text(
                        "${item.quantidade}x ${item.pizza.nome}"
                        "${item.adicionais.isNotEmpty ? " • ${item.adicionais.join(", ")}" : ""}",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // TOTAL
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "R\$ ${pedido.total.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}