import 'package:carousel_slider/carousel_slider.dart';
import 'package:embarque_solidario/views/add_doacoes.dart';
import 'package:embarque_solidario/views/doacoes_disponiveis.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dio/dio.dart';
import '../model/doacoes.dart';
import '../model/ItemModel.dart';

import '../widgets/custom_card.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.userName}) : super(key: key);

  final String userName;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> carouselItemsRegiao = [
    'https://i.imgur.com/7uyiZss.jpg',
    'https://i.imgur.com/Q2riFCl.jpg',
    'https://i.imgur.com/OsxwsKg.jpg',
    'https://i.imgur.com/qagvMAp.jpg',
  ];

  final List<String> carouselItemsRecomendados = [
    'https://i.imgur.com/7uyiZss.jpg',
    'https://i.imgur.com/qagvMAp.jpg',
    'https://i.imgur.com/Q2riFCl.jpg',
    'https://i.imgur.com/OsxwsKg.jpg'
  ];

  List<Doacoes> doacoes = [];

  @override
  void initState() {
    super.initState();
    fetchDoacoesFromDatabase().then((doacoes) {
      setState(() {
        this.doacoes = doacoes;
      });
    }).catchError((error) {
      print(error);
      // Trate o erro de acordo com a sua lógica
    });
  }

  Future<List<Doacoes>> fetchDoacoesFromDatabase() async {
    final String apiUrl = 'http://localhost:8080/itens';

    try {
      Dio dio = Dio();
      final response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = List.from(response.data);

        final List<Doacoes> doacoes = responseData.map((item) {
          ItemModel itemModel = ItemModel.fromJson(item);
          return Doacoes(
            item: itemModel,
            dateTime: DateTime.now(),
          );
        }).toList();

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
        backgroundColor: const Color(0xFF3742FA),
        title: Center(child: Text('Bem vindo, ${widget.userName}')),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF3742FA),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            DrawerItem(
              icon: Icons.add,
              title: 'Adicionar doações',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddDoacoes(doacoes: [],),
                  ),
                );
              },
            ),
            DrawerItem(
              icon: Icons.list,
              title: 'Doações',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoacoesDisponiveis(),
                  ),
                );
              },
            ),
            DrawerItem(
              icon: Icons.account_circle,
              title: 'Profile',
              onTap: () {
                // Implemente a ação quando o item for selecionado
              },
            ),
            DrawerItem(
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {
                // Implemente a ação quando o item for selecionado
              },
            ),
            DrawerItem(
              icon: Icons.logout,
              title: 'Sign Out',
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: double.maxFinite,
                    color: const Color(0xFF3742FA),
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Pesquisar...',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Categorias:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Recomendados na sua região',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  // Adicione os itens recomendados aqui
                                  CarouselSlider(
                                    options: CarouselOptions(
                                      height: 200,
                                      enableInfiniteScroll: false,
                                      viewportFraction: 0.3,
                                    ),
                                    items: doacoes.map((item) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return CustomCard(
                                            title: item.getItem.getNomeItem,
                                            description: item.getItem.getDescricaoItem,
                                            imageUrl: item.getItem.getImagem,
                                          );
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Recomendados para você',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 200,
                              enableInfiniteScroll: false,
                              viewportFraction: 0.3,
                            ),
                            items: doacoes.map((item) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return CustomCard(
                                    title: item.getItem.getNomeItem,
                                    description: item.getItem.getDescricaoItem,
                                    imageUrl: item.getItem.getImagem,
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 160,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: Image.network('https://i.imgur.com/2VoSA0f.png'),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        child: Image.network('https://i.imgur.com/Qi7tb17.png'),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        child: Image.network('https://i.imgur.com/YkfgmvA.png'),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        child: Image.network('https://i.imgur.com/dYZQBFD.png'),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        child: Image.network('https://i.imgur.com/RejJa08.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DrawerItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}


