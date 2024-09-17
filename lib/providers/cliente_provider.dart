import 'package:flutter/foundation.dart';
import '../models/cliente.dart';

class ClienteProvider with ChangeNotifier {
  List<Cliente> _clientes = [];

  List<Cliente> get clientes => _clientes;

  void agregarCliente(Cliente cliente) {
    _clientes.add(cliente);
    notifyListeners();
  }
}
