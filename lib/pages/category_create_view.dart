import 'package:flutter/material.dart';

class CategoryCreateView extends StatelessWidget {
  const CategoryCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Nova Categoria'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nome da Categoria',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Descrição',
              ),
              maxLines: 3, // Permitir múltiplas linhas para a descrição
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para salvar a nova categoria
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
