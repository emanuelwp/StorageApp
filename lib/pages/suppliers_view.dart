import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../api_service.dart';
import '../models/supplier.dart';
import 'supplier_create_view.dart';
import 'suppliers_details_view.dart';

class SuppliersView extends StatefulWidget {
  const SuppliersView({super.key});

  @override
  State<SuppliersView> createState() => _SuppliersViewState();
}

class _SuppliersViewState extends State<SuppliersView> {
  late Future<List<Supplier>> futureSuppliers;

  @override
  void initState() {
    super.initState();
    futureSuppliers = fetchSuppliers();
  }

  Future<List<Supplier>> fetchSuppliers() async {
    final response = await http.get(Uri.parse('$apiUrl/suppliers'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Supplier> suppliers = body.map((dynamic item) => Supplier.fromJson(item)).toList();
      return suppliers;
    } else {
      throw Exception('Failed to load suppliers');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fornecedores',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Digite o nome do fornecedor...',
                icon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<Supplier>>(
                future: futureSuppliers,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Erro ao carregar fornecedores'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('Nenhum fornecedor encontrado'));
                  } else {
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Nome')),
                          DataColumn(label: Text('Email')),
                          DataColumn(label: Text('')),
                        ],
                        rows: snapshot.data!.map((supplier) {
                          return DataRow(cells: [
                            DataCell(Container(
                              alignment: Alignment.center,
                              width: 75,
                              child: Text(supplier.name),
                            )),
                            DataCell(Container(
                              alignment: Alignment.center,
                              width: 75,
                              child: Text(supplier.email),
                            )),
                            DataCell(Container(
                              alignment: Alignment.center,
                              width: 75,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SuppliersDetailsView(supplier: supplier),
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.visibility),
                                  )
                                ],
                              ),
                            )),
                          ]);
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SupplierCreateView(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
