class ItemModel {
  final int? id;
  final String nomeItem;
  final String descricaoItem;
  final String endereco;
  final String imagem;

  ItemModel({
    this.id,
    required this.nomeItem,
    required this.descricaoItem,
    required this.endereco,
    required this.imagem,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      nomeItem: json['nomeItem'],
      descricaoItem: json['descricaoItem'],
      endereco: json['endereco'],
      imagem: json['imagem'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomeItem': nomeItem,
      'descricaoItem': descricaoItem,
      'endereco': endereco,
      'imagem': imagem,
    };
  }

  int? get getId => id;
  String get getNomeItem => nomeItem;
  String get getDescricaoItem => descricaoItem;
  String get getEndereco => endereco;
  String get getImagem => imagem;
}
