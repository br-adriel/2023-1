import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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

  void carregarCervejas() {
    tableStateNotifier.value = {
      "data": [
        {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
        {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
        {"name": "Duvel", "style": "Pilsner", "ibu": "82"}
      ],
      "propertyNames": ["name", "style", "ibu"],
      "columnNames": ["Nome", "Estilo", "IBU"],
    };
  }

  void carregarCafes() {
    tableStateNotifier.value = {
      "data": [
        {
          "tipo": "Arábica",
          "preparo": "Coado",
          "caracteristicas": "Sabor suave e doce"
        },
        {
          "tipo": "Robusta",
          "preparo": "Espresso",
          "caracteristicas": "Sabor forte e amargo"
        },
        {
          "tipo": "Bourbon",
          "preparo": "Coado ou espresso",
          "caracteristicas": "Sabor frutado e doce"
        },
        {
          "tipo": "Catuaí",
          "preparo": "Coado ou espresso",
          "caracteristicas": "Sabor suave e cítrico"
        },
        {
          "tipo": "Icatu",
          "preparo": "Coado ou espresso",
          "caracteristicas": "Sabor suave e doce"
        }
      ],
      "propertyNames": ["tipo", "preparo", "caracteristicas"],
      "columnNames": ["Tipo", "Preparo", "Características"],
    };
  }

  void carregarPaises() {
    tableStateNotifier.value = {
      "data": [
        {"nome": "Brasil", "capital": "Brasília", "populacao": "211.8 milhões"},
        {"nome": "França", "capital": "Paris", "populacao": "67.1 milhões"},
        {"nome": "Japão", "capital": "Tóquio", "populacao": "126.3 milhões"}
      ],
      "propertyNames": ["nome", "capital", "populacao"],
      "columnNames": ["Nome", "Capital", "População"],
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
