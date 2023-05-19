import 'package:embarque_solidario/model/doacoes.dart';
import 'package:flutter/material.dart';
import '../widgets/doacoes_list_item.dart';

class DoacoesDisponiveis extends StatelessWidget {
  final List<Doacoes> doacoes;

  DoacoesDisponiveis({required this.doacoes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Doações',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: doacoes.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            margin: const EdgeInsets.symmetric(vertical: 2),
            padding: const EdgeInsets.all(16),
            child: DoacoesListItem(doacoes: doacoes[index]),
          );
        },
      ),
    );
  }
}
