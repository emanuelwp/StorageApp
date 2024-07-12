import 'package:flutter/material.dart';
import 'package:untitled1/pages/category_create_view.dart';
import 'package:untitled1/pages/category_details_view.dart';
import 'package:untitled1/repositories/category_repository.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    final tabela = CategoryRepository.tabela;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias',
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
                hintText: 'Digite o nome da categoria...',
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
                    DataColumn(label: Text('Descrição')),
                    DataColumn(label: Text('')),
                  ],
                  rows: tabela.map((category) {
                    return DataRow(cells: [
                      DataCell(Container(
                        alignment: Alignment.center,
                        width: 75,
                        child: Text(category.name),
                      )),
                      DataCell(Container(
                        alignment: Alignment.center,
                        width: 75,
                        child: Text(category.description),
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
                                        CategoryDetailsView(category: category),
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
              builder: (context) => const CategoryCreateView(),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.black,),
      ),
    );
  }
}