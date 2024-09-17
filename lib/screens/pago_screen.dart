import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cliente.dart';
import '../providers/cliente_provider.dart';

class PagoScreen extends StatefulWidget {
  @override
  _PagoScreenState createState() => _PagoScreenState();
}

class _PagoScreenState extends State<PagoScreen> {
  Cliente? clienteSeleccionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pago de Cuota'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Consumer<ClienteProvider>(
          builder: (context, clienteProvider, child) {
            if (clienteProvider.clientes.isEmpty) {
              return Center(
                child: Text(
                  'No hay clientes registrados.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[600]),
                ),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: DropdownButton<Cliente>(
                        hint: Text('Selecciona un cliente'),
                        value: clienteSeleccionado,
                        onChanged: (Cliente? value) {
                          setState(() {
                            clienteSeleccionado = value;
                          });
                        },
                        items: clienteProvider.clientes.map((Cliente cliente) {
                          return DropdownMenuItem<Cliente>(
                            value: cliente,
                            child: Text(cliente.nombre),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  if (clienteSeleccionado != null) ...[
                    Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cuotas pagadas: ${clienteSeleccionado!.cuotasPagadas}',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Cuotas restantes: ${clienteSeleccionado!.cuotasTotales - clienteSeleccionado!.cuotasPagadas}',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text('Pagar Cuota'),
                              onPressed: () {
                                setState(() {
                                  if (clienteSeleccionado!.cuotasPagadas < clienteSeleccionado!.cuotasTotales) {
                                    clienteSeleccionado!.cuotasPagadas++;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
