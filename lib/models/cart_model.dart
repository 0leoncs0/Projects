import '../models/pizza_model.dart';

class CartItem {
  final Pizza pizza;
  int quantidade;

  CartItem({required this.pizza, this.quantidade = 1});
}

class Cart {
  static final Cart _instance = Cart._internal();

  factory Cart() {
    return _instance;
  }

  Cart._internal();

  final List<CartItem> itens = [];

  void adicionar(Pizza pizza) {
    final index = itens.indexWhere((item) => item.pizza.nome == pizza.nome);

    if (index >= 0) {
      itens[index].quantidade++;
    } else {
      itens.add(CartItem(pizza: pizza));
    }
  }

  void remover(Pizza pizza) {
    itens.removeWhere((item) => item.pizza.nome == pizza.nome);
  }

  double get total {
    return itens.fold(
      0,
      (sum, item) => sum + (item.pizza.preco * item.quantidade),
    );
  }

  void limpar() {
    itens.clear();
  }
}
