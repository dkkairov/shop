import 'package:flutter/material.dart';
import 'package:shop/domain/data_providers/product_data_provider.dart';
import 'package:shop/domain/data_providers/product_group_data_provider.dart';
import 'package:shop/domain/data_providers/user_data_provider.dart';
import 'package:shop/domain/services/auth_service.dart';
import 'package:shop/ui/navigation/main_navigation.dart';

class ProductModel extends ChangeNotifier {
  final _authService = AuthService();
  final productGroupService = ProductGroupDataProvider();
  final productService = ProductDataProvider();
  final user = UserDataProvider().loadValue();

  List<int> cartIdList = [];
  int cartTotal = 0;
  List<List<int>> ordersList = [];

  Future<void> onLogoutPressed(BuildContext context) async {
    await _authService.logout();
    MainNavigation.showLoader(context);
  }

  void addToCart(int index, int price) {
    cartIdList.add(index);
    cartTotal = cartTotal + price;
    notifyListeners();
  }

  void deleteFromCart(int index, int price) {
    cartIdList.removeAt(index);
    cartTotal = cartTotal - price;
    notifyListeners();
  }

  void addOrder(List<int> list) {
    ordersList.add(list);
    cartIdList.clear();
    cartTotal = 0;
    notifyListeners();
  }

  int sumOrderTotal(List<List<int>> ordersList, index) {
    int _total = 0;
    for (var element in ordersList[index]) {
      final _price = productService.getProduct(element).price;
      _total = _total + _price;
    }
    return _total;
  }
}
