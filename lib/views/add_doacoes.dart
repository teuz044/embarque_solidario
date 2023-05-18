import 'package:embarque_solidario/model/doacoes.dart';
import 'package:embarque_solidario/views/doacoes_disponiveis.dart';
import 'package:flutter/material.dart';

class AddDoacoes extends StatefulWidget {
  @override
  State<AddDoacoes> createState() => _AddDoacoesState();
}

class _AddDoacoesState extends State<AddDoacoes> {
  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerDescription = TextEditingController();

  List<Doacoes> doacoes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionando doações"),
      ),
      body: Column(
        children: [
          TextField(
            controller: controllerTitle,
            decoration: InputDecoration(labelText: 'Título'),
          ),
          TextField(
            controller: controllerDescription,
            decoration: InputDecoration(labelText: 'Descrição'),
          ),
          ElevatedButton(
            onPressed: () {
              String title = controllerTitle.text;
              String description = controllerDescription.text;
              setState(() {
                Doacoes newDoacao = Doacoes(
                  title: title,
                  description: description,
                  dateTime: DateTime.now(),
                );
                doacoes.add(newDoacao);
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoacoesDisponiveis(doacoes: doacoes),
                ),
              );
            },
            child: Text('Enviar'),
          ),
        ],
      ),
    );
  }
}
