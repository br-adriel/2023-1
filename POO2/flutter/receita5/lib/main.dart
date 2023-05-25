import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

var dataObjects = [];

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
          body: DataTableWidget(jsonObjects: dataObjects),
          bottomNavigationBar: const NewNavBar2(),
        ));
  }
}

class NewNavBar extends HookWidget {
  const NewNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var state = useState(1);

    return BottomNavigationBar(
      onTap: (index) {
        state.value = index;
      },
      currentIndex: state.value,
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
            label: "Nações", icon: Icon(Icons.flag_outlined))
      ],
    );
  }
}

class NewNavBar2 extends StatefulWidget {
  const NewNavBar2({super.key});

  @override
  State<NewNavBar2> createState() => _NewNavBar2State();
}

class _NewNavBar2State extends State<NewNavBar2> {
  int _navbarActiveIndex = 0;

  void _setNavbarActiveIndex(int newValue) {
    setState(() {
      _navbarActiveIndex = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        _setNavbarActiveIndex(index);
      },
      currentIndex: _navbarActiveIndex,
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
            label: "Nações", icon: Icon(Icons.flag_outlined))
      ],
    );
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;

  const DataTableWidget({super.key, this.jsonObjects = const []});

  @override
  Widget build(BuildContext context) {
    var columnNames = ["Nome", "Estilo", "IBU"],
        propertyNames = ["name", "style", "ibu"];

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
            ),
          )
          .toList(),
      rows: jsonObjects
          .map(
            (obj) => DataRow(
              cells: propertyNames
                  .map((propName) => DataCell(Text(obj[propName])))
                  .toList(),
            ),
          )
          .toList(),
    );
  }
}
