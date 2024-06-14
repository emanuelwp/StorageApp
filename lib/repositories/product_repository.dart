import 'package:untitled1/models/product.dart';

class ProductRepository {
  static List<Product> tabela = [
    Product(
        icon: './images/lapis.png',
        name: 'lápis',
        supplier: 'mattel',
        category: 'Material escolar',
        cod: 1,
        quantity: 20,
        stockQuant: 10,
        showcaseQuant: 10,
        stockQuantMin: 15,
        showcaseQuantiMin: 10),

    Product(
        icon: './images/caderno.png',
        name: 'caderno',
        supplier: 'tilibra',
        category: 'Material escolar',
        cod: 2,
        quantity: 40,
        stockQuant: 25,
        showcaseQuant: 15,
        stockQuantMin: 15,
        showcaseQuantiMin: 15)
  ];


}
