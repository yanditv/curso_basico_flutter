import 'package:flutter/material.dart';

class PaginaConEstado extends StatefulWidget {
  const PaginaConEstado({super.key});

  @override
  State<PaginaConEstado> createState() => _PaginaConEstadoState();
}

class _PaginaConEstadoState extends State<PaginaConEstado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagina con estado"),
      ),
      body: Column(children: [Container()]),
    );
  }
}
