import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../api_service.dart';

class SupplierCreateView extends StatelessWidget {
  const SupplierCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController cnpjController = TextEditingController();
    final TextEditingController cepController = TextEditingController();

    Future<void> _createSupplier() async {
      try {
        final response = await http.post(
          Uri.parse('$apiUrl/suppliers'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'name': nameController.text,
            'email': emailController.text,
            'cnpj': cnpjController.text,
            'cep': cepController.text,
          }),
        );

        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Fornecedor criado com sucesso!')),
          );
          Navigator.pop(context); // Volta para a tela anterior
        } else {
          print(response);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Erro ao criar fornecedor!')),
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
        title: const Text('Criar Novo Fornecedor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nome do Fornecedor',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: cnpjController,
              decoration: const InputDecoration(
                labelText: 'CNPJ',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: cepController,
              decoration: const InputDecoration(
                labelText: 'CEP',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _createSupplier();
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
