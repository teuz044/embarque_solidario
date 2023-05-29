import 'dart:math';

import 'package:embarque_solidario/data/dummy_doacoes.dart';
import 'package:embarque_solidario/model/doacoes.dart';
import 'package:flutter/material.dart';

class Doacoes with ChangeNotifier {
  final Map<String, Doacao> _items = {...DUMMY_DOACOES};

  List<Doacao> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Doacao byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Doacao doacao) {
    if (doacao == null) {
      return;
    }

    if (doacao.id != null &&
        !doacao.id.trim().isEmpty &&
        _items.containsKey(doacao.id)) {
      _items.update(
        doacao.id,
        (_) => Doacao(
          id: doacao.id,
          title: doacao.title,
          description: doacao.description,
          dateTime: doacao.dateTime,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => Doacao(
              title: doacao.title,
              description: doacao.description,
              dateTime: doacao.dateTime,
              id: id));
    }
    notifyListeners();
  }

  void remove(Doacao doacao) {
    if (doacao != null && doacao.id != null) {
      _items.remove(doacao.id);
      notifyListeners();
    }
  }
}
