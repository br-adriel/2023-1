import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Cervejas")),
        body: Center(
          child: DataTable(columns: const [
            DataColumn(label: Text("Nome")),
            DataColumn(label: Text("Estilo")),
            DataColumn(label: Text("IBU"))
          ], rows: const [
            DataRow(cells: [
              DataCell(Text('La Fin Du Monde')),
              DataCell(Text('Bock')),
              DataCell(Text('65')),
            ]),
            DataRow(cells: [
              DataCell(Text('Sapporo Premium')),
              DataCell(Text('Sour')),
              DataCell(Text('54')),
            ]),
            DataRow(cells: [
              DataCell(Text('Duvel')),
              DataCell(Text('Pilsner')),
              DataCell(Text('82')),
            ]),
          ]),
        ),
      ),
    );
  }
}
