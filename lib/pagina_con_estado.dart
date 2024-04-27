import 'package:flutter/material.dart';

class PaginaConEstado extends StatefulWidget {
  const PaginaConEstado({super.key});

  @override
  State<PaginaConEstado> createState() => _PaginaConEstadoState();
}

class _PaginaConEstadoState extends State<PaginaConEstado> {
  var nombre = "Juan Perez";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagina con estado"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Nombre",
              hintText: "Ingrese su nombre",
              icon: Icon(
                Icons.person,
                color: Colors.pinkAccent,
              ),
            ),
            onChanged: (value) {
              setState(() {
                nombre = value;
              });
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Apellidos",
              hintText: "Ingrese sus Apllidos",
              icon: Icon(
                Icons.person,
                color: Colors.pinkAccent,
              ),
            ),
            onChanged: (value) {
              setState(() {
                nombre = value;
              });
            },
          ),
          const SizedBox(height: 20.0),
          Text(
            nombre,
            style: TextStyle(fontSize: 32.0),
          ),
        ]),
      ),
    );
  }
}
