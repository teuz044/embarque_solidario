import 'package:embarque_solidario/model/doacoes.dart';
import 'package:flutter/material.dart';

class DoacaoTile extends StatelessWidget {
  final Doacao doacao;
  const DoacaoTile(this.doacao);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(doacao.title,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        subtitle: Text(
          doacao.description,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
      ),
    );
  }
}
