import 'pizza_model.dart';

class CartItem {
  final Pizza pizza;
  final int quantidade;
  final List<String> adicionais;
  final double precoTotal;

  CartItem({
    required this.pizza,
    required this.quantidade,
    required this.adicionais,
    required this.precoTotal,
  });
}