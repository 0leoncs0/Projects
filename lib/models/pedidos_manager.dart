import 'pedido_model.dart';

class PedidosManager {
  static final PedidosManager _instance =
      PedidosManager._internal();

  factory PedidosManager() {
    return _instance;
  }

  PedidosManager._internal();

  final List<Pedido> pedidos = [];

  void adicionarPedido(Pedido pedido) {
    pedidos.add(pedido);
  }
}