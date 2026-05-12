import '../models/pizza_model.dart';


class CartItem {
  final Pizza pizza;
  int quantidade;

  final List<String> adicionais;

  final double precoTotal;

  CartItem({
    required this.pizza,
    this.quantidade = 1,
    this.adicionais = const [],
    required this.precoTotal,
  });
}

class Cart {
  static final Cart _instance = Cart._internal();

  factory Cart() {
    return _instance;
  }

  Cart._internal();

  final List<CartItem> itens = [];

  void adicionar(CartItem item) {
  itens.add(item);
}

  void remover(Pizza pizza) {
    itens.removeWhere((item) => item.pizza.nome == pizza.nome);
  }

  double get total {
    return itens.fold(
      0,
      (sum, item) => sum + item.precoTotal,
    );
  }

  void limpar() {
    itens.clear();
  }
}
