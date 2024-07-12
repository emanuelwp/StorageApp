import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/api_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int amountWithStock = 0;
  List<String> nameWithStock = [];
  int amountWithoutStock = 0;
  List<String> nameWithoutStock = [];
  int amountStockMin = 0;
  List<String> nameStockMin = [];
  int amountShowcaseMin = 0;
  List<String> nameShowcaseMin = [];

  bool isLoading = false;

  Future<void> _fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse('$apiUrl/products/dashboard'),
          headers: {
            'Content-Type': 'application/json',
          });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          amountWithStock = data['amountWithStock'];
          nameWithStock = data['nameWithStock'].cast<String>();
          amountWithoutStock = data['amountWithoutStock'];
          nameWithoutStock = data['nameWithoutStock'].cast<String>();
          amountStockMin = data['amountStockMin'];
          nameStockMin = data['nameStockMin'].cast<String>();
          amountShowcaseMin = data['amountShowcaseMin'];
          nameShowcaseMin = data['nameShowcaseMin'].cast<String>();
          isLoading = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error fetching data!')),
        );
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Network or other error!')),
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _showProductNames(List<String> productNames) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Produtos'),
          content: SingleChildScrollView(
            child: ListBody(
              children: productNames.map((name) => Text(name)).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard de Estoque',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildStockCard(
                    title: 'Em estoque',
                    count: '$amountWithStock produtos',
                    icon: Icons.check_circle_outline,
                    color: Colors.green,
                    onButtonPressed: () => _showProductNames(nameWithStock),
                  ),
                  _buildStockCard(
                    title: 'Abaixo do mínimo - estoque',
                    count: '$amountStockMin produtos',
                    icon: Icons.warning,
                    color: Colors.amber,
                    onButtonPressed: () => _showProductNames(nameStockMin),
                  ),
                  _buildStockCard(
                    title: 'Abaixo do mínimo - vitrine',
                    count: '$amountShowcaseMin produtos',
                    icon: Icons.warning,
                    color: Colors.orange,
                    onButtonPressed: () => _showProductNames(nameShowcaseMin),
                  ),
                  _buildStockCard(
                    title: 'Sem estoque',
                    count: '$amountWithoutStock produtos',
                    icon: Icons.cancel,
                    color: Colors.red,
                    onButtonPressed: () => _showProductNames(nameWithoutStock),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStockCard({
    required String title,
    required String count,
    required IconData icon,
    required Color color,
    required VoidCallback onButtonPressed,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: color,
                ),
                Text(
                  count,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: onButtonPressed,
                child: const Text('Ver Produtos'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
