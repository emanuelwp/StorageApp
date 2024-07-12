import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import '../api_service.dart';

class ProductCreateView extends StatefulWidget {
  const ProductCreateView({super.key});

  @override
  _ProductCreateViewState createState() => _ProductCreateViewState();
}

class _ProductCreateViewState extends State<ProductCreateView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController stockQuantityController = TextEditingController();
  final TextEditingController showcaseQuantityController = TextEditingController();
  final TextEditingController minStockQuantityController = TextEditingController();
  final TextEditingController minShowcaseQuantityController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _createProduct() async {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecione uma imagem!')),
      );
      return;
    }

    try {
      final request = http.MultipartRequest('POST', Uri.parse('$apiUrl/products'));

      request.fields['name'] = nameController.text;
      request.fields['quantity'] = (int.parse(stockQuantityController.text) + int.parse(showcaseQuantityController.text)).toString();
      request.fields['stockQuantity'] = stockQuantityController.text;
      request.fields['showcaseQuantity'] = showcaseQuantityController.text;
      request.fields['minStockQuantity'] = minStockQuantityController.text;
      request.fields['minShowcaseQuantity'] = minShowcaseQuantityController.text;
      request.fields['categoryId'] = categoryController.text;

      final fileName = path.basename(_image!.path);
      request.files.add(await http.MultipartFile.fromPath('icon', _image!.path, filename: fileName));

      final response = await request.send();

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Produto criado com sucesso!')),
        );
        Navigator.pop(context); // Volta para a tela anterior
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro ao criar produto!')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro de rede ou outro problema!')),
      );
    }
  }

  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Galeria'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Câmera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

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
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Produto',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: stockQuantityController,
                decoration: const InputDecoration(
                  labelText: 'Quantidade em Estoque',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: showcaseQuantityController,
                decoration: const InputDecoration(
                  labelText: 'Quantidade em Vitrine',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: minStockQuantityController,
                decoration: const InputDecoration(
                  labelText: 'Quantidade Mínima em Estoque',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: minShowcaseQuantityController,
                decoration: const InputDecoration(
                  labelText: 'Quantidade Mínima em Vitrine',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(
                  labelText: 'Categoria',
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  TextButton(
                    child: const Text("Clique aqui para adicionar uma imagem"),
                    onPressed: () {
                      _showImageSourceActionSheet(context);
                    },
                  ),
                ],
              ),
              if (_image != null)
                Image.file(
                  _image!,
                  height: 100,
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _createProduct,
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
