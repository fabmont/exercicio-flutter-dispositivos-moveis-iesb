import 'package:flutter/material.dart';
import 'dart:math';

class CriarCarroModal extends StatefulWidget {
  final Function addNewCar;

  const CriarCarroModal({Key? key, required this.addNewCar}) : super(key: key);

  @override
  _CriarCarroModalState createState() => _CriarCarroModalState();
}

class _CriarCarroModalState extends State<CriarCarroModal> {
  final _nomeInputController = TextEditingController();
  final _marcaInputController = TextEditingController();

  void _dispatchNewCar() {
    final _nome = _nomeInputController.text;
    final _marca = _nomeInputController.text;

    if (_nome.isEmpty || _marca.isEmpty) {
      return;
    }

    widget.addNewCar(_nome, _marca, Random().nextInt(100 - 1).toString());
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(right: 20, top: 30, left: 20),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 12),
              child: const Text('Cadastrar carro',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          TextField(
            controller: _nomeInputController,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              labelText: 'Nome',
              filled: true,
            ),
          ),
          Container(margin: const EdgeInsets.only(top: 24)),
          TextField(
            controller: _marcaInputController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _dispatchNewCar(),
            decoration: const InputDecoration(
              labelText: 'Marca',
              filled: true,
            ),
          ),
          Container(margin: const EdgeInsets.only(top: 16)),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _dispatchNewCar,
              child: const Text('Salvar'),
            ),
          ),
        ],
      ),
    );
  }
}
