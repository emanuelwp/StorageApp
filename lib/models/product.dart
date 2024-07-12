class Product {
  final int id;
  final String name;
  final int quantity;
  final int stockQuantity;
  final int showcaseQuantity;
  final int minStockQuantity;
  final int minShowcaseQuantity;
  final int categoryId;
  final String createdAt;
  final String updatedAt;
  final Category category;
  final String icon;

  Product({
    required this.id,
    required this.name,
    required this.quantity,
    required this.stockQuantity,
    required this.showcaseQuantity,
    required this.minStockQuantity,
    required this.minShowcaseQuantity,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
    required this.icon,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      quantity: json['quantity'] ?? 0,
      stockQuantity: json['stock_quantity'] ?? 0,
      showcaseQuantity: json['showcase_quantity'] ?? 0,
      minStockQuantity: json['min_stock_quantity'] ?? 0,
      minShowcaseQuantity: json['min_showcase_quantity'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      category: Category.fromJson(json['category']),
      icon: json['icon'] ?? '',
    );
  }
}

class Category {
  final int id;
  final String name;
  final String description;
  final String createdAt;
  final String updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}
