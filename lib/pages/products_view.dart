import 'package:flutter/material.dart';
import 'package:untitled1/pages/products_details_view.dart';
import 'package:untitled1/repositories/produto_repository.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
    final tabela = ProdutoRepository.tabela;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Digite o nome do produto...',
              ),
            ),
            const SizedBox(height: 16),
            DataTable(
              columns: const [
                DataColumn(label: Text('Produto')),
                DataColumn(label: Text('Fornecedor')),
                DataColumn(label: Text('Quantidade')),
              ],
              rows: tabela.map((product) {
                return DataRow(cells: [
                  DataCell(Text(product.name)),
                  DataCell(Text(product.supplier)),
                  DataCell(Row(
                    children: [
                      Text('${product.quantity}'),
                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ProductDetailsView(
                                product: product)));
                      }, icon: const Icon(Icons.visibility))
                    ],
                  )),
                ]);
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Center(child: Text('1 de 1'))
            , // Paginação
          ],
        ),
      ),
    );
  }
}
