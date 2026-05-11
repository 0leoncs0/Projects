import 'cart_model.dart';

class Pedido {
  final List<CartItem> itens;
  final double total;
  final String status;

  Pedido({
    required this.itens,
    required this.total,
    required this.status,
  });
}