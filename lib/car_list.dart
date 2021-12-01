import 'package:flutter/material.dart';
import 'package:flutter_pratica_3/models/cars.dart';

class CarsList extends StatelessWidget {
  final List<Cars> cars;
  final Function deleteCar;

  const CarsList({Key? key, required this.cars, required this.deleteCar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cars.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Nenhum carro foi cadastrado ainda.\nToque no + abaixo e crie um carro.',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          : ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              separatorBuilder: (_, index) => const Divider(),
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(
                    cars[index].nome,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    cars[index].marca,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => deleteCar(cars[index].id),
                  ),
                );
              },
              itemCount: cars.length,
            ),
    );
  }
}
