import 'package:flutter/material.dart';

class MeusPedidosPage extends StatelessWidget {
  const MeusPedidosPage({super.key});

  @override
  Widget build(BuildContext context) {
    // PEDIDOS EXEMPLO
    final pedidos = [
      {
        "numero": "#1001",
        "status": "Em preparo",
        "itens": "1x Calabresa\n1x Coca-Cola 2L",
        "total": 54.00,
        "icone": Icons.local_pizza,
        "cor": Colors.orange,
      },
      {
        "numero": "#1002",
        "status": "Entregue",
        "itens": "1x Chocolate com Morango",
        "total": 48.00,
        "icone": Icons.check_circle,
        "cor": Colors.green,
      },
      {
        "numero": "#1003",
        "status": "Saiu para entrega",
        "itens": "2x Frango c/ Catupiry",
        "total": 100.00,
        "icone": Icons.delivery_dining,
        "cor": Colors.blue,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Pedidos"),
      ),

      body: ListView.builder(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // TOPO
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        "Pedido ${pedido["numero"]}",
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
                          color:
                              (pedido["cor"] as Color)
                                  .withOpacity(0.15),

                          borderRadius:
                              BorderRadius.circular(20),
                        ),

                        child: Row(
                          children: [
                            Icon(
                              pedido["icone"] as IconData,
                              size: 18,
                              color: pedido["cor"] as Color,
                            ),

                            const SizedBox(width: 6),

                            Text(
                              pedido["status"].toString(),
                              style: TextStyle(
                                color:
                                    pedido["cor"] as Color,
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

                  Text(
                    pedido["itens"].toString(),
                    style: TextStyle(
                      color: Colors.grey[700],
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
                        "R\$ ${(pedido["total"] as double).toStringAsFixed(2)}",
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