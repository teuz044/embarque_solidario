import 'package:http/http.dart' as http;
import 'package:embarque_solidario/views/doacoes_disponiveis.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../model/Doacoes.dart';
import '../model/ItemModel.dart';

class AddDoacoes extends StatefulWidget {
  final List<Doacoes> doacoes;

  const AddDoacoes({Key? key, required this.doacoes}) : super(key: key);

  @override
  State<AddDoacoes> createState() => _AddDoacoesState();
}

class _AddDoacoesState extends State<AddDoacoes> {

  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerDescription = TextEditingController();
  final TextEditingController controllerEndereco = TextEditingController();
  final TextEditingController controllerImage = TextEditingController();

  Future<void> enviarDoacao() async {
    String titleItem = controllerTitle.text;
    String descriptionItem = controllerDescription.text;
    String enderecoItem = controllerEndereco.text;
    String urlImagem = controllerImage.text;

    final String apiUrl = 'http://localhost:8080/itens'; // Substitua pela URL correta da sua API

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final ItemModel doacao = ItemModel(
      nomeItem: titleItem,
      descricaoItem: descriptionItem,
      endereco: enderecoItem,
      imagem: urlImagem,
    );

    final dio = Dio();
    final response = await dio.post(
      apiUrl,
      options: Options(headers: {'Content-Type': 'application/json'}),
      data: doacao.toJson(),
    );

    if (response.statusCode == 201) {
      print('Doação enviada com sucesso');
      // Redirecionar para a página de sucesso ou exibir uma mensagem de sucesso
    } else {
      print('Falha ao enviar a doação');
      print('Status code: ${response.statusCode}');
      // Exibir uma mensagem de erro ao usuário ou tratar a falha de acordo com a sua lógica
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF3742FA),
        title: Text(
          'Adicionar doação',
          style: TextStyle(color: Colors.white),
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
                _showImageInputDialog(context); // Exibir o diálogo para inserir o link da imagem
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
                hintText: 'Adicione uma descrição do item.',
              ),
              maxLines: 3,
            ),
          ),
          SizedBox(height: 20),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Endereço:',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: controllerEndereco,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite seu endereço aqui',
              ),
              maxLines: 3,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3742FA)),
            ),
            onPressed: () async {
              await enviarDoacao(); // Chama a função para enviar a doação para o backend
              String titleItem = controllerTitle.text;
              String descriptionItem = controllerDescription.text;
              setState(() {
                Doacoes newDoacao = Doacoes(
                  item: ItemModel(
                    nomeItem: titleItem,
                    descricaoItem: descriptionItem,
                    endereco: '',
                    imagem: '',
                  ),
                  dateTime: DateTime.now(),
                );
                widget.doacoes.add(newDoacao); // Adicione a nova doação à lista de doações disponíveis
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoacoesDisponiveis(),
                ),
              );
            },
            child: Text('Enviar'),
          ),
        ],
      ),
    );
  }

  void _showImageInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Inserir Link da Imagem'),
          content: TextField(
            controller: controllerImage,
            decoration: InputDecoration(
              hintText: 'Digite o URL da imagem',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirmar'),
              onPressed: () {
                String imageUrl = controllerImage.text;
                // Faça algo com o link da imagem, como atualizar a visualização da imagem
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
