import 'dart:html';
import 'package:flutter/material.dart';

class VisualizarDoacoes extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultTextStyle(
          style: TextStyle(
            color: Colors.black,
            fontSize: 20, // Define a cor do texto do título como preto
          ),
          child: Text('Doações'),
        ),
        centerTitle: true,
        leading: IconButton(
          alignment: Alignment.center,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Adicionar aqui a ação do botão de volta
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              // Adicionar as ação do botão de notificações
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        // Espaçamento ao redor do conteúdo
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250, // Altura da ListView
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                children: [
                  // Coloque aqui os itens da ListView
                  // Exemplo de um item:
                  Container(
                    width: 330,
                    color: Colors.blue,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: Text('Imagem 1',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Container(
                    width: 330,
                    color: Colors.blue,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: Text('Imagem 2',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Container(
                    width: 330,
                    color: Colors.blue,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: Text('Imagem 3',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Descrição:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5), // Espaçamento vertical entre os elementos
            TextField(
              decoration: InputDecoration(
                hintText: 'Adicione uma descrição',
                border: OutlineInputBorder(),
              ),
              maxLines: 3, // Define o número máximo de linhas do campo de texto
            ),
            SizedBox(height: 6),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Requisitos:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('° lorem ipsum'),
                  SizedBox(height: 4),
                  Text('° lorem ipsum'),
                  SizedBox(height: 4),
                  Text('° lorem ipsum'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // Aqui eu vou adicionar ação do botão "Solicitar doação"
        },
        child: Text('Solicitar doação', style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          backgroundColor: Colors.blue,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}