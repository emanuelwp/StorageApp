import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../api_service.dart';

class CategoryCreateView extends StatelessWidget {
  const CategoryCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    Future<void> _createCategory() async {
      try {
        final response = await http.post(
          Uri.parse('$apiUrl/categories'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'name': nameController.text,
            'description': descriptionController.text,
          }),
        );

        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Categoria criada com sucesso!')),
          );
          Navigator.pop(context); // Volta para a tela anterior
        } else {
          print(response);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Erro ao criar categoria!')),
          );
        }
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro de rede ou outro problema!')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Nova Categoria'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nome da Categoria',
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Descrição',
              ),
              maxLines: 3, // Permitir múltiplas linhas para a descrição
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _createCategory();
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
