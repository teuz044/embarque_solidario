
class ItemModel {
  String image;
  String name;
  String description;

  ItemModel({
    required this.name,
    required this.description,
    required this.image,
  });
  // Método para converter um objeto Produto em um Map para inserção no banco de dados
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'image': image,
    };
  }

  // Método estático para criar um objeto Produto a partir de um Map recuperado do banco de dados
  static ItemModel fromMap(Map<String, dynamic> map) {
    return ItemModel(
      name: map['name'],
      description: map['description'],
      image: map['image'],
    );
  }
}
