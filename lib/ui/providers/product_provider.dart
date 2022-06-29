import 'package:flutter/material.dart';
import 'package:shop/domain/data_providers/product_data_provider.dart';
import 'package:shop/domain/data_providers/product_group_data_provider.dart';
import 'package:shop/domain/data_providers/user_data_provider.dart';
import 'package:shop/domain/services/auth_service.dart';
import 'package:shop/ui/navigation/main_navigation.dart';
import 'package:shop/domain/entities/product.dart';

class ProductModel extends ChangeNotifier {
  final _authService = AuthService();
  final productGroupService = ProductGroupDataProvider();
  final productService = ProductDataProvider();
  final user = UserDataProvider().loadValue();

  List<Product> cartList = [];
  int cartTotal = 0;
  List<List<Product>> ordersList = [];

  Future<void> onLogoutPressed(BuildContext context) async {
    await _authService.logout();
    MainNavigation.showLoader(context);
  }

  void addToCart(int index) {
    final _product = productService.getProduct(index);
    final _price = _product.price;
    cartList.add(_product);
    cartTotal = cartTotal + _price;
    notifyListeners();
  }

  void deleteFromCart(int index, int price) {
    cartList.removeAt(index);
    cartTotal = cartTotal - price;
    notifyListeners();
  }

  void addOrder(List<Product> list) {
    ordersList.add(list);
    cartList.clear();
    cartTotal = 0;
    notifyListeners();
    print(ordersList);
  }

  int sumOrderTotal(List<List<Product>> ordersList, index) {
    int _total = 0;
    for (var element in ordersList[index]) {
        final _price = element.price;
        _total = _total + _price;
    }
    return _total;
  }
}
