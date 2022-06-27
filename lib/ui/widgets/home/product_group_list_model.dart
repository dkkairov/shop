import 'package:flutter/material.dart';
import 'package:shop/domain/data_providers/product_data_provider.dart';
import 'package:shop/domain/data_providers/product_group_data_provider.dart';
import 'package:shop/domain/entities/order.dart';
import 'package:shop/domain/entities/product.dart';
import 'package:shop/domain/services/auth_service.dart';
import 'package:shop/ui/navigation/main_navigation.dart';

class ProductGroupListModel extends ChangeNotifier {
  final _authService = AuthService();
  final productGroupService = ProductGroupDataProvider();
  final productService = ProductDataProvider();

  List<int> cartIdList = [];
  List<List<int>> ordersList = [];

  Future<void> onLogoutPressed(BuildContext context) async {
    await _authService.logout();
    MainNavigation.showLoader(context);
  }

  void addToCart(int index) {
    cartIdList.add(index);
    notifyListeners();
    print('cartIdList: $cartIdList');
  }

  void deleteFromCart(int index) {
    cartIdList.removeAt(index);
    notifyListeners();
    print('cartIdList: $cartIdList');
  }

  void addOrder(list) {
    ordersList.add(list);
    cartIdList.clear();
    notifyListeners();
    print('ordersList: $ordersList');
    print('cartIdList: $cartIdList');
  }

  int sumOrderTotal(ordersList, index) {
    int _total = 0;
    for (var element in ordersList[index]) {
      final _price = productService.getProduct(element).price;
      _total = _total + _price;
    }
    return _total;
  }
}