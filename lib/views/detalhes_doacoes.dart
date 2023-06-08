import 'package:embarque_solidario/views/sucesso_doacao.dart';
import 'package:flutter/material.dart';
import '../model/doacoes.dart';

class DetalhesDoacoes extends StatelessWidget {
  final Doacoes doacao;

  const DetalhesDoacoes({required this.doacao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3742FA),
        title: Text('Detalhes da Doação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome do Item:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(doacao.item.getNomeItem),
            SizedBox(height: 16),
            Text(
              'Descrição:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(doacao.item.getDescricaoItem),
            SizedBox(height: 16),
            Text(
              'Imagem:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 0),
            Expanded(
              child: Center(
                child: SizedBox(
                  height: 600,
                  width: 600, // Defina a altura desejada para a imagem
                  child: Image.network(
                    doacao.item.getImagem,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3742FA)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SucessoDoacao(),
                    ),
                  );
                },
                child: Text('Doe para mim'),
              ),

            ),
          ],
        ),
      ),
    );
  }
}