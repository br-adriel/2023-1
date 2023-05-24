import 'package:flutter/material.dart';

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Expanded(
        child: Text("La Fin Du Monde - Bock - 65 ibu"),
      ),
      Expanded(
        child: Text("Sapporo Premiume - Sour Ale - 54 ibu"),
      ),
      Expanded(
        child: Text("Duvel - Pilsner - 82 ibu"),
      )
    ]);
  }
}

class BarraTopo extends StatelessWidget implements PreferredSizeWidget {
  const BarraTopo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: const Text("Dicas"));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const Scaffold(
          appBar: BarraTopo(),
          body: HomePage(),
          bottomNavigationBar: NewNavBar(
            icones: [
              Icon(Icons.coffee_outlined),
              Icon(Icons.local_drink_outlined),
              Icon(Icons.flag_outlined),
            ],
          )),
    );
  }
}

void main() {
  MyApp app = const MyApp();
  runApp(app);
}
