import 'package:carousel_slider/carousel_slider.dart';
import 'package:embarque_solidario/views/add_doacoes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.userName}) : super(key: key);

  final String userName;

  @override
  Widget build(BuildContext context) {
    final List<String> carouselItems = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3742FA),
        title: Center(child: Text('Bem vindo, $userName')),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Adicione ação do menu lateral aqui
              Scaffold.of(context).openDrawer();
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
                    builder: (context) => AddDoacoes(),
                  ),
                );
              },
            ),
            DrawerItem(
              icon: Icons.list,
              title: 'Doações',
              onTap: () {
                // Implemente a ação quando o item for selecionado
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
              },
            ),
          ],
        ),
      ),
      body: Stack(
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
                        height:
                            22), // Espaçamento entre o TextField e o texto "Categorias"
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
                                  height: 250,
                                  enableInfiniteScroll: false,
                                  viewportFraction: 0.3,
                                ),
                                items: carouselItems.map((item) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Card(
                                        child: SizedBox(
                                          height: 250,
                                          width: 250,
                                          child: Center(
                                            child: Text(
                                              item,
                                              style:
                                                  const TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ),
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
                          'Recomendados para voce',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 250,
                          enableInfiniteScroll: false,
                          viewportFraction: 0.3,
                        ),
                        items: carouselItems.map((item) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Card(
                                child: Container(
                                  height: 250,
                                  width: 250,
                                  child: Center(
                                    child: Text(
                                      item,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
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
                    color: Colors.grey,
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
