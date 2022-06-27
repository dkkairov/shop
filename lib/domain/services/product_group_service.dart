import 'package:shop/domain/data_providers/product_group_data_provider.dart';
import 'package:shop/domain/entities/product_group.dart';

class ProductGroupService {
  final _productGroupDataProvider = ProductGroupDataProvider();
  late List<ProductGroup> _groupList;
  List<ProductGroup> get groupList => _groupList;

  Future<void> initialize() async {
    _groupList = _productGroupDataProvider.loadProductGroups();
  }
}
