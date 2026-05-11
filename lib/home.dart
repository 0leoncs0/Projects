import 'package:flutter/material.dart';
import 'package:delivery/screens/cardapio.dart';
import 'package:delivery/screens/carrinho.dart';
import 'package:delivery/screens/meus_pedidos.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bella Napoli"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Carrossel de Destaques
            SizedBox(
              height: 200,
              child: PageView(
                children: [
                  _bannerDestaque(Color(0xFFA41616), "Promoção de Terça!"),
                  _bannerDestaque(Colors.orange, "Combo Família"),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Categorias",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // 2. Seção de Categorias (Adicionada de volta)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _botaoCategoria(Icons.local_pizza, "Salgadas", context),
                _botaoCategoria(Icons.icecream, "Doces", context),
                _botaoCategoria(Icons.local_drink, "Bebidas", context),
              ],
            ),

            const SizedBox(height: 20),

            // 3. Botão para ver Cardápio Completo
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity, // Botão ocupa a largura toda
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const CardapioPage(categoriaSelecionada: "Todos"),
                      ),
                    );
                  },
                  child: const Text("Ver Cardápio Completo"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: SizedBox(
                width: double.infinity,

                child: OutlinedButton.icon(
                  icon: const Icon(Icons.receipt_long),

                  label: const Text("Meus Pedidos"),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MeusPedidosPage(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget dos Banners
  Widget _bannerDestaque(Color cor, String texto) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          texto,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Widget das Categorias
  Widget _botaoCategoria(IconData icone, String label, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CardapioPage(categoriaSelecionada: label),
          ),
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xFFA41616).withOpacity(0.1),
            child: Icon(icone, color: Color(0xFFA41616), size: 30),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
