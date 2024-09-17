class Cliente {
  final String nombre;
  final double cantidadPrestada;
  final int cuotasTotales;
  int cuotasPagadas;

  Cliente({
    required this.nombre,
    required this.cantidadPrestada,
    required this.cuotasTotales,
    this.cuotasPagadas = 0,
  });
}
