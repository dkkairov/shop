import 'package:flutter/material.dart';
import 'package:shop/domain/data_providers/product_data_provider.dart';

class ProductListModel extends ChangeNotifier {
  final productService = ProductDataProvider();

}