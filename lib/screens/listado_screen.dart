import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cliente_provider.dart';

class ListadoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de Clientes'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Consumer<ClienteProvider>(
        builder: (context, clienteProvider, child) {
          if (clienteProvider.clientes.isEmpty) {
            return Center(
              child: Text('No hay clientes registrados',
                  style: TextStyle(fontSize: 18)),
            );
          }
          return ListView.builder(
            itemCount: clienteProvider.clientes.length,
            itemBuilder: (context, index) {
              final cliente = clienteProvider.clientes[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: 5,
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  title: Text(cliente.nombre, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  subtitle: Text('Préstamo: \$${cliente.cantidadPrestada}', style: TextStyle(fontSize: 16)),
                  trailing: Text('${cliente.cuotasPagadas}/${cliente.cuotasTotales} cuotas',
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
