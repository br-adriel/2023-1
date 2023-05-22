import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styled_text/styled_text.dart';
import 'package:transparent_image/transparent_image.dart';

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
              const Text("Terminando..."),
              FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image:
                      'https://s2.glbimg.com/niKmZWnyym0htQy4OvGJxM1Jpq4=/0x0:445x571/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_ba3db981e6d14e54bb84be31c923b00c/internal_photos/bs/2022/G/g/sfiAXTTUCZD0yYxu7nDg/calca-de-shopping-1.jpg')
            ])),
            bottomNavigationBar: const Row(
              children: [
                Expanded(
                  child: ElevatedButton(onPressed: null, child: Text("Voltar")),
                ),
                Expanded(
                  child:
                      ElevatedButton(onPressed: null, child: Text("Iniciar")),
                ),
                Expanded(
                  child: IconButton(onPressed: null, icon: Icon(Icons.search)),
                ),
              ],
            )));
  }
}

void main() {
  MyApp app = const MyApp();
  runApp(app);
}
