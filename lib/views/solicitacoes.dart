import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;

class Solicitacoes extends StatefulWidget {
  @override
  _SolicitacoesState createState() => _SolicitacoesState();
}

class _SolicitacoesState extends State<Solicitacoes> {
  final List<Furniture> furnitureList = [
    Furniture(
      imagePath: 'images/mesa-doacao.jpg',
      description: 'Mesa com 4 cadeiras',
    ),
    Furniture(
      imagePath: 'images/armario.jpg',
      description: 'Armário',
    ),
    Furniture(
      imagePath: 'images/cama.png',
      description: 'Cama Box',
    ),
  ];

  Future<bool?> _showDeleteConfirmationDialog(int index) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmação'),
          content: Text('Deseja realmente cancelar esta solicitação?'),
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

  void _cancelarSolicitacao(int index) async {
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
                          ElevatedButton(
                            onPressed: () {
                              _cancelarSolicitacao(index);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Color(0x7bfb0303),
                            ),
                            child: Text(
                              'Cancelar solicitação',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            width:
                                16, // Defina o espaçamento desejado entre os botões
                          ),
                          SizedBox(
                            width: 150, // Defina a largura máxima desejada
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                // Ação do botão
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black, backgroundColor: Color(0xffcfcfcf),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.visibility),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text('Visualizar'),
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
                : null,
          ),
          title: Text(
            widget.title,
            style: TextStyle(
              color: _isHovered
                  ? Colors.white
                  : null,
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