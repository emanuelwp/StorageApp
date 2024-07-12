import 'package:flutter/material.dart';
import 'package:untitled1/pages/supplier_create_view.dart';
import 'package:untitled1/pages/suppliers_details_view.dart';
import 'package:untitled1/repositories/supplier_repository.dart';

class SuppliersView extends StatefulWidget {
  const SuppliersView({super.key});

  @override
  State<SuppliersView> createState() => _SuppliersViewState();
}

class _SuppliersViewState extends State<SuppliersView> {
  @override
  Widget build(BuildContext context) {
    final tabela = SupplierRepository.tabela;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fornecedores',
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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Nome')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('')),
                  ],
                  rows: tabela.map((supplier) {
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
                                    builder: (context) =>
                                        SuppliersDetailsView(supplier: supplier),
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
        child: const Icon(Icons.add, color: Colors.black,),
      ),
    );
  }
}
