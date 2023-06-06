import 'ItemModel.dart';

class Doacoes {
  final ItemModel item;
  final DateTime dateTime;

  Doacoes({
    required this.item,
    required this.dateTime,
  });

  factory Doacoes.fromItemModel(ItemModel item) {
    return Doacoes(
      item: item,
      dateTime: DateTime.now(),
    );
  }

  ItemModel get getItem => item;
  DateTime get getDateTime => dateTime;
}
