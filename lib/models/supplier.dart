// models/supplier.dart
class Supplier {
  final int id;
  final String name;
  final String email;
  final String cnpj;
  final String cep;

  Supplier({required this.id, required this.name, required this.email, required this.cnpj, required this.cep});

  factory Supplier.fromJson(Map<String, dynamic> json) {
    return Supplier(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      cnpj: json['cnpj'],
      cep: json['cep'],
    );
  }
}
