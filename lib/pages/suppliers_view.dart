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
    final suppliers = SupplierRepository.suppliers;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                  hintText: 'Digite o nome do produto...',
                  icon: Icon(Icons.search)
              ),
            ),
            const SizedBox(height: 16),
            DataTable(
              columns: const [
                DataColumn(label: Text('Ícone')),
                DataColumn(label: Text('Nome')),
                DataColumn(label: Text('Email')),
              ],
              rows: suppliers.map((supplier) {
                return DataRow(cells: [
                  DataCell(Image.asset(supplier.icon)),
                  DataCell(Text(supplier.name)),
                  DataCell(Row(
                    children: [
                      Text(supplier.email),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SuppliersDetailsView(supplier: supplier)));
                          },
                          icon: const Icon(Icons.visibility))
                    ],
                  )),
                ]);
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Center(child: Text('1 de 1')), // Paginação
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
