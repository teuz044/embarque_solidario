import 'package:flutter/material.dart';
import 'package:embarque_solidario/model/doacoes.dart';

class DoacoesListItem extends StatelessWidget {
  const DoacoesListItem({Key? key, required this.doacoes}) : super(key: key);
  final Doacoes doacoes;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(doacoes.title),
      direction: DismissDirection.endToStart, // definir a direção para arrastar
      onDismissed: (direction) {
        // chamar a função onDelete quando o item for arrastado
      },
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.grey,
        child: const Icon(Icons.delete, color: Colors.grey),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(doacoes.title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            Text(
              doacoes.description,
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
              Padding(
                padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    doacoes.dateTime.toString(),
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
