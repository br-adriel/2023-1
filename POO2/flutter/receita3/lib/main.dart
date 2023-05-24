import 'package:flutter/material.dart';

void main() {
  MyApp app = const MyApp();

  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Dicas"),
          ),
          body: const DataBodyWidget(objects: [
            "La Fin Du Monde - Bock - 65 ibu",
            "Sapporo Premiume - Sour Ale - 54 ibu",
            "Duvel - Pilsner - 82 ibu"
          ]),
          bottomNavigationBar: const NewNavBar(
            icones: [
              Icon(Icons.coffee_outlined),
              Icon(Icons.local_drink_outlined),
              Icon(Icons.flag_outlined),
            ],
          ),
        ));
  }
}

class NewNavBar extends StatelessWidget {
  final List<Icon> icones;

  const NewNavBar({super.key, required this.icones});

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: botaoFoiTocado,
      items: icones.map((icone) {
        return BottomNavigationBarItem(label: "Cafés", icon: icone);
      }).toList(),
    );
  }
}

class DataBodyWidget extends StatelessWidget {
  final List<String> objects;

  const DataBodyWidget({super.key, this.objects = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: objects
            .map((obj) => Expanded(
                  child: Center(child: Text(obj)),
                ))
            .toList());
  }
}
