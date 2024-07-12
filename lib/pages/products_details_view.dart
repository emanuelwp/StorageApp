import 'package:flutter/material.dart';
import 'package:untitled1/models/product.dart';

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
          Text('Categoria: ${widget.product.category}',
              style: const TextStyle(fontSize: 16)),
          Text('Quantidade: ${widget.product.quantity}',
              style: const TextStyle(fontSize: 16)),
          Text('Quantidade em estoque ${widget.product.stockQuant}',
              style: const TextStyle(fontSize: 16)),
          Text('Quantidade em vitrine ${widget.product.showcaseQuant}',
              style: const TextStyle(fontSize: 16)),
          Text('Quantidade mínima em estoque ${widget.product.stockQuantMin}',
              style: const TextStyle(fontSize: 16)),
          Text(
              'Quantidade mínima em vitrine ${widget.product.showcaseQuantiMin}',
              style: const TextStyle(fontSize: 16)),
          SizedBox(
            width: 50,
            child: Image.asset(widget.product.icon),
          )
        ]),
      ),
    );
  }
}
