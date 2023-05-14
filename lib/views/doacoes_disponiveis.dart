import 'package:flutter/material.dart';

class DoacoesDiponiveis extends StatefulWidget {
  const DoacoesDiponiveis({super.key});

  @override
  State<DoacoesDiponiveis> createState() => _DoacoesDiponiveisState();
}

class _DoacoesDiponiveisState extends State<DoacoesDiponiveis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Doações disponíveis",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Card(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "",
        child: const Icon(Icons.filter_list_alt),
      ),
    );
  }
}
