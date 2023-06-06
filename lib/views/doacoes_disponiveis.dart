import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../widgets/doacoes_list_item.dart';
import '../model/doacoes.dart';
import '../model/ItemModel.dart';

class DoacoesDisponiveis extends StatefulWidget {
  @override
  State<DoacoesDisponiveis> createState() => _DoacoesDisponiveisState();
}

class _DoacoesDisponiveisState extends State<DoacoesDisponiveis> {
  List<Doacoes> doacoes = [];
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    getDoacoes().then((doacoes) {
      setState(() {
        this.doacoes = doacoes;
      });
    }).catchError((error) {
      print(error);
      // Trate o erro de acordo com a sua lógica
    });
  }

  Future<List<Doacoes>> getDoacoes() async {
    final String apiUrl = 'http://localhost:8080/itens';

    try {
      final response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = List.from(response.data);

        final List<Doacoes> doacoes = responseData.map((item) =>
            Doacoes.fromItemModel(ItemModel.fromJson(item))).toList();

        return doacoes;
      } else {
        throw Exception('Falha ao obter as doações');
      }
    } catch (e) {
      throw Exception('Erro de conexão');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Doações',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder<List<Doacoes>>(
        future: getDoacoes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao obter as doações'),
            );
          } else if (snapshot.hasData) {
            final doacoes = snapshot.data!;

            return ListView.builder(
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
            );
          } else {
            return Center(
              child: Text('Nenhuma doação disponível'),
            );
          }
        },
      ),
    );
  }
}
