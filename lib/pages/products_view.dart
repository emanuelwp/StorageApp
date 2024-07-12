import 'package:flutter/material.dart';
import 'package:untitled1/pages/product_create_view.dart';
import 'package:untitled1/pages/products_details_view.dart';
import 'package:untitled1/repositories/product_repository.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
    final tabela = ProductRepository.tabela;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos',
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
                hintText: 'Digite o nome do produto...',
                icon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Ícone')),
                    DataColumn(label: Text('Produto')),
                    DataColumn(label: Text('')),
                  ],
                  rows: tabela.map((product) {
                    return DataRow(cells: [
                      DataCell(Container(
                        alignment: Alignment.center,
                        width: 75,
                        child: Image.asset(product.icon, height: 30, alignment: Alignment.centerLeft),
                      )),
                      DataCell(Container(
                        alignment: Alignment.center,
                        width: 75,
                        child: Text(product.name),
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
                                        ProductDetailsView(product: product),
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
              builder: (context) => const ProductCreateView(),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.black,),
      ),
    );
  }
}
