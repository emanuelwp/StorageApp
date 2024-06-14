import 'package:flutter/material.dart';

class ProductCreateView extends StatelessWidget {
  const ProductCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Novo Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nome do Produto',
              ),
            ),
            const TextField(
              decoration:  InputDecoration(
                labelText: 'Fornecedor',
              ),
            ),
            const TextField(
              decoration:  InputDecoration(
                labelText: 'Quantidade',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para salvar o novo produto
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
