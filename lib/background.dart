import 'package:flutter/material.dart';

class BackgroundPage extends StatelessWidget {
  const BackgroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
        image: DecorationImage(
          image:
              AssetImage('assets/images/background.jpg'), // Ruta de la imagen de fondo
          fit: BoxFit.cover, // Ajusta la imagen al tamaño del contenedor
        ),
      )),
    );
  }
}
