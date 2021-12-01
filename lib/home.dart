import 'package:flutter/material.dart';
import 'package:flutter_pratica_3/car_list.dart';
import 'package:flutter_pratica_3/criar_carro_modal.dart';
import 'package:flutter_pratica_3/models/cars.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Cars> carList = [];

  void addNewCar(String nome, String marca, String id) {
    final payload = Cars(id: id, nome: nome, marca: marca);

    setState(() {
      carList.add(payload);
    });
  }

  void _deleteCar(String id) {
    setState(() {
      carList.removeWhere((tx) => tx.id == id);
    });
  }

  void _openBottomSheetModal(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: CriarCarroModal(
              addNewCar: addNewCar,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cars'),
        centerTitle: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openBottomSheetModal(context),
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CarsList(
              cars: carList,
              deleteCar: _deleteCar,
            ),
          ],
        ),
      ),
    );
  }
}
