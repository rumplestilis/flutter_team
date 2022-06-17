import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../custom.dart';
import 'Bus.dart';
import 'BusList.dart';
import 'Utils.dart';

class BusPage extends StatefulWidget {
  @override
  State<BusPage> createState() => _BuPage();
}

class _BuPage extends State<BusPage> {
  late List<Bus> bus;
  bool diponibilite = false;
  final numBusController = TextEditingController();
  final nbSiegeController = TextEditingController();
  final numMatController = TextEditingController();

  @override
  void initState() {
    super.initState();
    this.bus = List.of(allBus);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: buildDataTable()),
      floatingActionButton: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          showAddBusDialog();
        },
      ),
    );
  }

  Future showAddBusDialog() async {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                elevation: 8,
                content: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Column(
                    children: [
                      const Text(
                        "Ajout Bus",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: numBusController,
                        decoration: const InputDecoration(
                          labelText: "N° bus",
                        ),
                      ),
                      TextField(
                        controller: numMatController,
                        decoration: const InputDecoration(
                          labelText: "N° Mat",
                        ),
                      ),
                      TextField(
                        controller: nbSiegeController,
                        decoration: const InputDecoration(
                          labelText: "Nb Siege",
                        ),
                      ),
                      ListTile(
                        title: const Text("Disponiblilité"),
                        leading: Checkbox(
                          onChanged: (value) {
                            setState(() {
                              diponibilite = value!;
                            });
                          },
                          value: diponibilite,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Annuler")),
                  FlatButton(onPressed: () {}, child: const Text("Ajouter")),
                ],
              );
            },
          );
        });
  }

  Widget buildDataTable() {
    final columns = ['N°Bus', 'N° Mat', 'Nb Siege', 'Disp'];
    return DataTable(columns: getColumns(columns), rows: getRows(bus));
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(label: Text(column));
    }).toList();
  }

  List<DataRow> getRows(List<Bus> bus) => bus.map((Bus bus) {
        final cells = [
          bus.numBus,
          bus.numMatricule,
          bus.nbSiege,
          bus.disponibilite
        ];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            return DataCell(
              Text('$cell'),
            );
          }),
        );
      }).toList();
}
