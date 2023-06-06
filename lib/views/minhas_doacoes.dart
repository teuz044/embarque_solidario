import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;


class MinhasDoacoes extends StatefulWidget {
  @override
  _MinhasDoacoesState createState() => _MinhasDoacoesState();
}

class _MinhasDoacoesState extends State<MinhasDoacoes> {
  final List<Furniture> furnitureList = [
    Furniture(
      imagePath: 'images/geladeira.jpg',
      description: 'Geladeira',
    ),
    Furniture(
      imagePath: 'images/guarda-roupa.jpg',
      description: 'Guarda-roupa',
    ),
    Furniture(
      imagePath: 'images/ventilador.jpg',
      description: 'Ventilador',
    ),
  ];

  Future<bool?> _showDeleteConfirmationDialog(int index) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Apagar'),
          content: Text('Deseja realmente apagar a doação?'),
          actions: [
            TextButton(
              child: Text('Não'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('Sim'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  void _apagarDoacao(int index) async {
    bool? confirmDelete = await _showDeleteConfirmationDialog(index);
    if (confirmDelete != null && confirmDelete) {
      setState(() {
        furnitureList.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultTextStyle(
          style: TextStyle(
            color: Colors.black,
            fontSize: 20, // Define a cor do texto do título como preto
          ),
          child: Text('Minhas Solicitações'),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              // Ação ao pressionar o ícone de notificações
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff2136f3),
              ),
              child: Text(
                'Embarque Solidário',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            DrawerItem(
              icon: Icons.home,
              title: 'Início',
              onTap: () {
                // Implemente a ação quando o item for selecionado
              },
            ),
            DrawerItem(
              icon: Icons.add_box_sharp,
              title: 'Doações',
              onTap: () {
                // Implemente a ação quando o item for selecionado
              },
            ),
            DrawerItem(
              icon: Icons.message,
              title: 'Mensagens',
              onTap: () {
                // Implemente a ação quando o item for selecionado
              },
            ),
            DrawerItem(
              icon: Icons.account_circle,
              title: 'Perfil usuário',
              onTap: () {
                // Implemente a ação quando o item for selecionado
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: furnitureList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 1.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Define o raio da borda
              ),
              color: Color(0xFFEFEFEF),
              child: Row(
                children: [
                  Container(
                    // container da imagem
                    color: Color(0xFFD9D9D9), // Cor do container da imagem
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      furnitureList[index].imagePath,
                      height: 150,
                      width: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      color: Color(
                          0xFFEFEFEF), // Cor do container do título e botões
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 2),
                            child: Text(
                              furnitureList[index].description,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150, // Defina a largura máxima desejada
                            child: ElevatedButton(
                              onPressed: () {
                                _apagarDoacao(index);
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black, backgroundColor: Color(0xffcfcfcf),
                              ),
                              child: Builder(
                                builder: (BuildContext context) {
                                  return Row(
                                    children: [
                                      IconTheme(
                                        data: IconThemeData(
                                          color: Colors
                                              .red, // Defina a cor desejada para o ícone
                                        ),
                                        child: Icon(Icons.delete),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8),
                                        child: Text('Apagar'),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150, // Defina a largura máxima desejada
                            child: ElevatedButton(
                              onPressed: () {
                                //acao de editar
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black, backgroundColor: Color(0xffcfcfcf),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.edit),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text('Editar'),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ação quando o botão "Adicionar Doação" for pressionado
        },
        tooltip: 'Adicionar nova doação',
        backgroundColor: Color(0xff2136f3),
        child: Icon(Icons.add),
      ),
    );
  }
}

class DrawerItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final foundation.VoidCallback onTap;

  const DrawerItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) {
        setState(() {
          _isHovered = value;
        });
      },
      child: Container(
        color: _isHovered
            ? Color(0xff2136f3)
            : null, // Defina a cor de fundo quando o mouse estiver sobre o botão
        child: ListTile(
          leading: Icon(
            widget.icon,
            color: _isHovered
                ? Colors.white
                : null, // Defina a cor do ícone quando o mouse estiver sobre o botão
          ),
          title: Text(
            widget.title,
            style: TextStyle(
              color: _isHovered
                  ? Colors.white
                  : null, // Defina a cor do texto quando o mouse estiver sobre o botão
            ),
          ),
        ),
      ),
    );
  }
}

class Furniture {
  final String imagePath;
  final String description;

  Furniture({required this.imagePath, required this.description});
}