import 'dart:js_util';

import 'package:embarque_solidario/components/doacoao_tile.dart';
import 'package:embarque_solidario/provider/doacoes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_doacoes.dart';

class DoacoesDisponiveis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Doacoes doacoes = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Doações'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddDoacoes(),
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: doacoes.count,
          itemBuilder: (ctx, i) => DoacaoTile(doacoes.all.elementAt(i))),
    );
  }
}
