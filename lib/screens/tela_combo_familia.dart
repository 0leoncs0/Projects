import 'package:flutter/material.dart';
import '../models/pizza_model.dart';
import '../models/cart_model.dart';

class TelaComboFamilia extends StatefulWidget {
  const TelaComboFamilia({super.key});

  @override
  State<TelaComboFamilia> createState() => _TelaComboFamiliaState();
}

class _TelaComboFamiliaState extends State<TelaComboFamilia> {
  Pizza? pizza1;
  Pizza? pizza2;
  Pizza? bebida;

  final List<Pizza> pizzas = menuPizzas
      .where((p) => p.categoria == 'Salgadas' || p.categoria == 'Doces')
      .toList();

  final List<Pizza> bebidas =
      menuPizzas.where((p) => p.categoria == 'Bebidas').toList();

  static const double precoCombo = 99.90;

  double get totalSemDesconto {
    double total = 0;
    if (pizza1 != null) total += pizza1!.preco;
    if (pizza2 != null) total += pizza2!.preco;
    if (bebida != null) total += bebida!.preco;
    return total;
  }

  double get economia => totalSemDesconto - precoCombo;

  bool get comboCompleto =>
      pizza1 != null && pizza2 != null && bebida != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Combo Família'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Banner do combo
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.orange,
            child: Column(
              children: [
                const Text(
                  'Combo Família',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '2 Pizzas + 1 Bebida 2L',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'R\$ ${precoCombo.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (comboCompleto && economia > 0)
                  Text(
                    'Você economiza R\$ ${economia.toStringAsFixed(2)}!',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _secaoSelecao(
                  titulo: 'Pizza 1',
                  selecionado: pizza1,
                  opcoes: pizzas,
                  onSelecionado: (p) => setState(() => pizza1 = p),
                ),
                const SizedBox(height: 16),
                _secaoSelecao(
                  titulo: 'Pizza 2',
                  selecionado: pizza2,
                  opcoes: pizzas,
                  onSelecionado: (p) => setState(() => pizza2 = p),
                ),
                const SizedBox(height: 16),
                _secaoSelecao(
                  titulo: 'Bebida',
                  selecionado: bebida,
                  opcoes: bebidas,
                  onSelecionado: (p) => setState(() => bebida = p),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: comboCompleto ? Colors.orange : Colors.grey,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: comboCompleto
              ? () {
                  // Cria uma pizza especial representando o combo inteiro
                  final pizzaCombo = Pizza(
                    nome:
                        'Combo Família (${pizza1!.nome} + ${pizza2!.nome} + ${bebida!.nome})',
                    descricao:
                        '2 pizzas + 1 bebida — ${pizza1!.nome}, ${pizza2!.nome}, ${bebida!.nome}',
                    preco: precoCombo,
                    imagem: pizza1!.imagem, // usa imagem da primeira pizza
                    categoria: 'Combo',
                  );

                  Cart().adicionar(CartItem(
                    pizza: pizzaCombo,
                    quantidade: 1,
                    adicionais: [],
                    precoTotal: precoCombo,
                  ));

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Combo Família adicionado ao carrinho! '),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              : null,
          child: Text(
            comboCompleto
                ? 'Adicionar Combo — R\$ ${precoCombo.toStringAsFixed(2)}'
                : 'Selecione os 3 itens para continuar',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _secaoSelecao({
    required String titulo,
    required Pizza? selecionado,
    required List<Pizza> opcoes,
    required ValueChanged<Pizza> onSelecionado,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo,
            style:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        selecionado != null
            ? ListTile(
                tileColor: Colors.orange.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.orange.shade200),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    selecionado.imagem,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 50,
                      height: 50,
                      color: Colors.orange.shade100,
                      child:
                          const Icon(Icons.local_pizza, color: Colors.orange),
                    ),
                  ),
                ),
                title: Text(selecionado.nome,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(
                  'R\$ ${selecionado.preco.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.orange),
                ),
                trailing: TextButton(
                  onPressed: () =>
                      _abrirSelecao(context, titulo, opcoes, onSelecionado),
                  child: const Text('Trocar'),
                ),
              )
            : OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.orange,
                  side: const BorderSide(color: Colors.orange),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.add),
                label: Text('Escolher $titulo'),
                onPressed: () =>
                    _abrirSelecao(context, titulo, opcoes, onSelecionado),
              ),
      ],
    );
  }

  void _abrirSelecao(
    BuildContext context,
    String titulo,
    List<Pizza> opcoes,
    ValueChanged<Pizza> onSelecionado,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.6,
        maxChildSize: 0.9,
        builder: (_, controller) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Escolher $titulo',
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: opcoes.length,
                itemBuilder: (_, index) {
                  final item = opcoes[index];
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        item.imagem,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: 50,
                          height: 50,
                          color: Colors.grey[200],
                          child: const Icon(Icons.local_pizza),
                        ),
                      ),
                    ),
                    title: Text(item.nome),
                    subtitle: Text(
                      item.descricao,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text(
                      'R\$ ${item.preco.toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      onSelecionado(item);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}