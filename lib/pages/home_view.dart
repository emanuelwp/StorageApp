import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: const <Widget>[
            StockPage(title: 'Em estoque', count: '1 produto'),
            StockPage(title: 'baixo do mínimo no estoque', count: '1 produto'),
            StockPage(title: 'Abaixo do mínimo na vitrine', count: '1 produto'),
            StockPage(title: 'Sem estoque', count: '0 produtos'),
          ],
        ),
      ),

    );
  }
}


//WIDGETS "CARDS"
class StockPage extends StatefulWidget {
  final String title;
  final String count;

  const StockPage({super.key, required this.title, required this.count});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(widget.count),
        trailing: const Icon(Icons.keyboard_arrow_down),
      ),
    );
  }
}