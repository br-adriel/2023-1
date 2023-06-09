import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum TableStatus { idle, loading, ready, error }

class DataService {
  List<void Function()> funcoesDeDados = [];

  DataService();

  final ValueNotifier<Map<String, dynamic>> tableStateNotifier = ValueNotifier({
    "data": [],
    "propertyNames": [''],
    "columnNames": [''],
    "status": TableStatus.idle,
    "sortColumnIndex": null,
    "sortAscending": true,
  });
  final ValueNotifier<int> quantidadeItensNotifier = ValueNotifier(5);

  void ordenar(int columnIndex, bool ascending) {
    String propriedade = tableStateNotifier.value['propertyNames'][columnIndex];
    tableStateNotifier.value['data'].sort((a, b) {
      dynamic valorA = a[propriedade];
      dynamic valorB = b[propriedade];
      if (valorA is Comparable && valorB is Comparable) {
        return ascending ? valorA.compareTo(valorB) : valorB.compareTo(valorA);
      } else {
        return 0;
      }
    });
    tableStateNotifier.value["sortColumnIndex"] = columnIndex;
    tableStateNotifier.value["sortAscending"] = ascending;
    tableStateNotifier.value = Map.from(tableStateNotifier.value);
  }

  void carregar(index) {
    funcoesDeDados = [
      carregarCafes,
      carregarCervejas,
      carregarPaises,
      carregarUsuarios,
    ];
    tableStateNotifier.value = {
      'status': TableStatus.loading,
      "propertyNames": [''],
      "columnNames": [''],
      "data": [],
      "sortColumnIndex": null,
      "sortAscending": true,
    };
    funcoesDeDados[index]();
  }

  void carregarCervejas() {
    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/beer/random_beer',
        queryParameters: {'size': '${quantidadeItensNotifier.value}'});
    http.read(beersUri).then((jsonString) {
      var beersJson = jsonDecode(jsonString);
      tableStateNotifier.value = {
        "data": beersJson,
        "propertyNames": ["name", "style", "ibu"],
        "columnNames": ["Nome", "Estilo", "IBU"],
        "status": TableStatus.ready,
        "sortColumnIndex": null,
        "sortAscending": true,
      };
    });
  }

  void carregarUsuarios() {
    var usersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/v2/users',
        queryParameters: {'size': '${quantidadeItensNotifier.value}'});
    http.read(usersUri).then((jsonString) {
      var usersJson = jsonDecode(jsonString);
      tableStateNotifier.value = {
        "data": usersJson,
        "propertyNames": ["first_name", "last_name", "username", "email"],
        "columnNames": ["Nome", "Sobrenome", "Usuário", "Email"],
        "status": TableStatus.ready,
        "sortColumnIndex": null,
        "sortAscending": true,
      };
    });
  }

  void carregarCafes() {
    var coffeeUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/coffee/random_coffee',
        queryParameters: {'size': '${quantidadeItensNotifier.value}'});
    http.read(coffeeUri).then((jsonString) {
      var coffeeJson = jsonDecode(jsonString);
      tableStateNotifier.value = {
        "data": coffeeJson,
        "propertyNames": ["blend_name", "variety", "origin"],
        "columnNames": ["Nome", "Variedade", "Origem"],
        "status": TableStatus.ready,
        "sortColumnIndex": null,
        "sortAscending": true,
      };
    });
  }

  void carregarPaises() {
    var nationsUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/nation/random_nation',
        queryParameters: {'size': '${quantidadeItensNotifier.value}'});
    http.read(nationsUri).then((jsonString) {
      var nationsJson = jsonDecode(jsonString);
      tableStateNotifier.value = {
        "data": nationsJson,
        "propertyNames": ["nationality", "language", "capital"],
        "columnNames": ["Nacionalidade", "Idioma", "Capital"],
        "status": TableStatus.ready,
        "sortColumnIndex": null,
        "sortAscending": true,
      };
    }).catchError((err) {
      tableStateNotifier.value["status"] = TableStatus.error;
    });
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
            title: const Text("Receita 8"),
            actions: [
              ValueListenableBuilder(
                valueListenable: dataService.quantidadeItensNotifier,
                builder: (_, value, __) {
                  return MenuQuantidade(
                    quantidade: value,
                  );
                },
              )
            ],
          ),
          body: ValueListenableBuilder(
              valueListenable: dataService.tableStateNotifier,
              builder: (_, value, __) {
                switch (value['status']) {
                  case TableStatus.idle:
                    return const Center(
                        child: Text("Olá, toque em algum botão para começar!"));

                  case TableStatus.loading:
                    return const Center(child: CircularProgressIndicator());

                  case TableStatus.ready:
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTableWidget(
                          jsonObjects: value['data'],
                          propertyNames: value['propertyNames'],
                          columnNames: value['columnNames'],
                          sortAscending: value['sortAscending'],
                          sortColumnIndex: value['sortColumnIndex'],
                        ),
                      ),
                    );
                  case TableStatus.error:
                    return const Center(child: Text("Lascou"));
                }
                return const Center(child: Text("..."));
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
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: "Cafés",
            icon: Icon(Icons.coffee_outlined),
          ),
          BottomNavigationBarItem(
            label: "Cervejas",
            icon: Icon(Icons.local_drink_outlined),
          ),
          BottomNavigationBarItem(
            label: "Nações",
            icon: Icon(Icons.flag_outlined),
          ),
          BottomNavigationBarItem(
            label: "Usuários",
            icon: Icon(Icons.people_alt_outlined),
          )
        ]);
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;
  final List<String> columnNames;
  final List<String> propertyNames;
  final int? sortColumnIndex;
  final bool sortAscending;

  const DataTableWidget({
    super.key,
    this.jsonObjects = const [],
    this.columnNames = const [],
    this.propertyNames = const [],
    this.sortAscending = true,
    this.sortColumnIndex,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: columnNames
          .map(
            (name) => DataColumn(
                label: Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                onSort: ((columnIndex, ascending) {
                  dataService.ordenar(columnIndex, ascending);
                })),
          )
          .toList(),
      rows: jsonObjects
          .map((obj) => DataRow(
              cells: propertyNames
                  .map((propName) => DataCell(Text(obj[propName])))
                  .toList()))
          .toList(),
      sortColumnIndex: sortColumnIndex,
      sortAscending: sortAscending,
    );
  }
}

class MenuQuantidade extends StatelessWidget {
  final int quantidade;

  const MenuQuantidade({super.key, required this.quantidade});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      initialValue: quantidade,
      tooltip: "Quantidade de itens",
      onSelected: (value) =>
          {dataService.quantidadeItensNotifier.value = value},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        const PopupMenuItem<int>(
          value: 5,
          child: Text("5 itens"),
        ),
        const PopupMenuItem<int>(
          value: 10,
          child: Text("10 itens"),
        ),
        const PopupMenuItem<int>(
          value: 15,
          child: Text("15 itens"),
        ),
        const PopupMenuItem<int>(
          value: 20,
          child: Text("20 itens"),
        ),
      ],
    );
  }
}
