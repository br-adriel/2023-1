import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styled_text/styled_text.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            textTheme:
                GoogleFonts.outfitTextTheme(Theme.of(context).textTheme)),
        home: Scaffold(
            appBar: AppBar(title: const Text("Meu app")),
            body: Center(
                child: Column(children: [
              const Text("Apenas começando..."),
              StyledText(
                text: "<i>Olá</i> <b>mundo</b>",
                tags: {
                  'b': StyledTextTag(
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  'i': StyledTextTag(
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 20)),
                },
              ),
              const Text("Terminando...")
            ])),
            bottomNavigationBar: const Row(
              children: [
                ElevatedButton(onPressed: null, child: Text("Voltar")),
                ElevatedButton(onPressed: null, child: Text("Iniciar")),
                IconButton(onPressed: null, icon: Icon(Icons.search))
              ],
            )));
  }
}

void main() {
  MyApp app = const MyApp();
  runApp(app);
}
