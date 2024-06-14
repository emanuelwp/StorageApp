import 'package:flutter/material.dart';
import 'package:untitled1/models/supplier.dart';


class SuppliersDetailsView extends StatefulWidget {
  const SuppliersDetailsView({super.key, required this.supplier});
  final Supplier supplier;

  @override
  State<SuppliersDetailsView> createState() => _SuppliersDetailsViewState();
}

class _SuppliersDetailsViewState extends State<SuppliersDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.supplier.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Divider(),
          Text('Nome: ${widget.supplier.name}',
              style: const TextStyle(fontSize: 20)),
          Text('Email: ${widget.supplier.email}',
              style: const TextStyle(fontSize: 16)),
          Text('CNPJ: ${widget.supplier.cnpj}',
              style: const TextStyle(fontSize: 16)),
          Text('CEP: ${widget.supplier.cep}',
              style: const TextStyle(fontSize: 16)),
          SizedBox(
            width: 50,
            child: Image.asset(widget.supplier.icon),
          )
        ]),
      ),
    );
  }
}
