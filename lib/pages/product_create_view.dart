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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Nome do Produto',
                ),
              ),
              const SizedBox(height: 12),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Quantidade em Estoque',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Quantidade em Vitrine',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Quantidade Mínima em Estoque',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Quantidade Mínima em Vitrine',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Categoria',
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  TextButton(
                    child: Text("Clique aqui para adicionar uma imagem"),
                    onPressed: () {
                      // Lógica para selecionar o ícone do produto
                    },
                  ),
                ],
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
      ),
    );
  }
}
