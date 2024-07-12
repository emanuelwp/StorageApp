import 'package:untitled1/models/supplier.dart';

class SupplierRepository {
  static List<Supplier> tabela = [
    Supplier(icon: './images/mattel,png',
        name: 'Mattel',
        email: 'mattel@gmail.com',
        cnpj: '1234',
        cep: '98240000'),
    Supplier(icon: './images/tilibra.png',
        name: 'Tilibra',
        email: 'tilibra@gmail.com',
        cnpj: '4321',
        cep: '97105210')


  ];
}