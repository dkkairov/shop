import 'package:shop/domain/entities/product.dart';

class OrderItem {
  final String id;
  final List<Product> products;

  OrderItem({
    required this.id,
    required this.products,
  });
}