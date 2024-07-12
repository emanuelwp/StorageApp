import 'package:flutter/material.dart';
import 'package:untitled1/models/category.dart'; // Importe o modelo de categoria adequado

class CategoryDetailsView extends StatefulWidget {
  const CategoryDetailsView({super.key, required this.category});
  final Category category; // Use o modelo de categoria correspondente

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name), // Use o nome da categoria como título
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Divider(),
          Text('Nome: ${widget.category.name}',
              style: const TextStyle(fontSize: 20)),
          Text('Descrição: ${widget.category.description}',
              style: const TextStyle(fontSize: 16)),
          // Adicione mais detalhes conforme necessário para o modelo de categoria
          SizedBox(
            width: 50,
            height: 50,
            child: Icon(Icons.category), // Você pode usar um ícone representativo de categoria aqui
          )
        ]),
      ),
    );
  }
}
