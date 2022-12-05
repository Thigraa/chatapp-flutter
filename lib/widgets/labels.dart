import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  final String titulo;
  final String subtitulo;

  const Labels({required this.ruta, required this.titulo, required this.subtitulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          titulo,
          style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 10),
        GestureDetector(
          child: Text(
            subtitulo,
            style: TextStyle(color: Colors.blue.shade600, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          onTap: () => Navigator.pushReplacementNamed(context, ruta),
        )
      ]),
    );
  }
}
