import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataService {
  List<void Function()> funcoesDeDados = [];

  DataService() {
    funcoesDeDados = [
      carregarCafes,
      carregarCervejas,
      carregarPaises,
    ];
  }
  final ValueNotifier<Map<String, dynamic>> tableStateNotifier = ValueNotifier({
    "data": [],
    "propertyNames": [''],
    "columnNames": ['']
  });

  void carregar(index) {
    funcoesDeDados[index]();
  }

  Future<void> carregarCervejas() async {
    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/beer/random_beer',
        queryParameters: {'size': '5'});
    var jsonString = await http.read(beersUri);
    var beersJson = jsonDecode(jsonString);
    tableStateNotifier.value = {
      "data": beersJson,
      "propertyNames": ["name", "style", "ibu"],
      "columnNames": ["Nome", "Estilo", "IBU"]
    };
  }

  Future<void> carregarCafes() async {
    var coffeeUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/coffee/random_coffee',
        queryParameters: {'size': '5'});
    var jsonString = await http.read(coffeeUri);
    var coffeeJson = jsonDecode(jsonString);
    tableStateNotifier.value = {
      "data": coffeeJson,
      "propertyNames": ["blend_name", "variety", "origin"],
      "columnNames": ["Nome", "Variedade", "Origem"]
    };
  }

  Future<void> carregarPaises() async {
    var coffeeUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/nation/random_nation',
        queryParameters: {'size': '5'});
    var jsonString = await http.read(coffeeUri);
    var coffeeJson = jsonDecode(jsonString);
    tableStateNotifier.value = {
      "data": coffeeJson,
      "propertyNames": ["nationality", "language", "capital"],
      "columnNames": ["Nacionalidade", "Idioma", "Capital"]
    };
  }
}

final dataService = DataService();
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
          body: ValueListenableBuilder(
              valueListenable: dataService.tableStateNotifier,
              builder: (_, value, __) {
                return DataTableWidget(
                    jsonObjects: value['data'],
                    propertyNames: value['propertyNames'],
                    columnNames: value['columnNames']);
              }),
          bottomNavigationBar: NewNavBar(
            itemSelectedCallback: dataService.carregar,
          ),
        ));
  }
}

class NewNavBar extends HookWidget {
  dynamic itemSelectedCallback;

  NewNavBar({super.key, this.itemSelectedCallback}) {
    itemSelectedCallback ??= (_) {};
  }

  @override
  Widget build(BuildContext context) {
    var state = useState(1);

    return BottomNavigationBar(
        onTap: (index) {
          state.value = index;
          itemSelectedCallback(index);
        },
        currentIndex: state.value,
        items: const [
          BottomNavigationBarItem(
            label: "Cafés",
            icon: Icon(Icons.coffee_outlined),
          ),
          BottomNavigationBarItem(
              label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
          BottomNavigationBarItem(
              label: "Nações", icon: Icon(Icons.flag_outlined))
        ]);
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;

  final List<String> columnNames;

  final List<String> propertyNames;

  const DataTableWidget(
      {super.key,
      this.jsonObjects = const [],
      this.columnNames = const [],
      this.propertyNames = const []});

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: columnNames
            .map((name) => DataColumn(
                label: Expanded(
                    child: Text(name,
                        style: const TextStyle(fontStyle: FontStyle.italic)))))
            .toList(),
        rows: jsonObjects
            .map((obj) => DataRow(
                cells: propertyNames
                    .map((propName) => DataCell(Text(obj[propName])))
                    .toList()))
            .toList());
  }
}
