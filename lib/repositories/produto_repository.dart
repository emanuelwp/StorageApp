import 'package:untitled1/models/produto.dart';

class ProdutoRepository {
  static List<Produto> tabela = [
    Produto(
        icon: './images/lapis.png',
        name: 'lápis',
        supplier: 'mattel',
        id: 1,
        quantity: 20,
        stockQuant: 10,
        showcaseQuant: 10,
        stockQuantMin: 15,
        showcaseQuantiMin: 10),

    Produto(
        icon: './images/caderno.png',
        name: 'caderno',
        supplier: 'tilibra',
        id: 2,
        quantity: 40,
        stockQuant: 25,
        showcaseQuant: 15,
        stockQuantMin: 15,
        showcaseQuantiMin: 15)
  ];


}
