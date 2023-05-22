import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Meu app")),
        body: const Center(
            child: Column(children: [
          Text("Apenas começando..."),
          Text("No meio..."),
          Text("Terminando...")
        ])),
        bottomNavigationBar: const Text("Botão 1"),
      ));

  runApp(app);
}
