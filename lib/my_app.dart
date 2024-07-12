import 'package:StorageApp/pages/categories_view.dart';
import 'package:StorageApp/pages/home_view.dart';
import 'package:StorageApp/pages/products_view.dart';
import 'package:StorageApp/pages/suppliers_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StorageApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const BasePage(),
    );
  }

}

//Esqueleto do app (Widget que chama as páginas)
class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const ProductsView(),
    const SuppliersView(),
    const CategoriesView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cultural Papelaria e Brinquedos'),
        backgroundColor: Colors.orange,
      ),
      body:Center(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,
        onTap: (int newIndex){
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Produtos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Fornecedores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
        ],
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}