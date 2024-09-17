import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/listado_screen.dart';
import 'screens/pago_screen.dart';
import 'screens/registrar_cliente_screen.dart';
import 'providers/cliente_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ClienteProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación de Préstamos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/registrar': (context) => RegistrarClienteScreen(),
        '/pago': (context) => PagoScreen(),
        '/listado': (context) => ListadoScreen(),
      },
    );
  }
}