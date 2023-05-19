import 'dart:html';

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
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Adicionar doação',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                // Lógica para alterar a imagem
              },
              icon: Icon(
                Icons.camera_alt,
                size: 40,
              ),
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Adicione uma imagem da doação',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Título:',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: controllerTitle,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'O que você está doando?',
              ),
              maxLines: 3,
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Descrição:',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: controllerDescription,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Adicione uma descrição da entrega.',
              ),
              maxLines: 3,
            ),
          ),
          SizedBox(height: 20),
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
