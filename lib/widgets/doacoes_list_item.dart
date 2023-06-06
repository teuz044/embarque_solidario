import 'package:flutter/material.dart';
import 'package:embarque_solidario/model/doacoes.dart';

class DoacoesListItem extends StatelessWidget {
  const DoacoesListItem({Key? key, required this.doacoes}) : super(key: key);
  final Doacoes doacoes;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(doacoes.item.nomeItem),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        // Chame a função onDelete quando o item for arrastado
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  doacoes.item.imagem,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16), // Espaçamento entre a imagem e o texto
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    doacoes.item.nomeItem,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    doacoes.item.descricaoItem,
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          doacoes.dateTime.toString(),
                          style: const TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
