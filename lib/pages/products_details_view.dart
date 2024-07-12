import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Divider(),
          Text('Nome: ${widget.product.name}',
              style: const TextStyle(fontSize: 20)),
          Text('Categoria: ${widget.product.categoryId}',
              style: const TextStyle(fontSize: 16)),
          Text('Quantidade: ${widget.product.quantity}',
              style: const TextStyle(fontSize: 16)),
          Text('Quantidade em estoque ${widget.product.stockQuantity}',
              style: const TextStyle(fontSize: 16)),
          Text('Quantidade em vitrine ${widget.product.showcaseQuantity}',
              style: const TextStyle(fontSize: 16)),
          Text('Quantidade mínima em estoque ${widget.product.minStockQuantity}',
              style: const TextStyle(fontSize: 16)),
          Text(
              'Quantidade mínima em vitrine ${widget.product.minShowcaseQuantity}',
              style: const TextStyle(fontSize: 16)),
        ]),
      ),
    );
  }
}
