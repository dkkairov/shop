import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/ui/theme/app_colors.dart';
import 'package:shop/ui/widgets/cart/cart_screen.dart';
import 'package:shop/ui/widgets/product_list/product_group_list_screen.dart';
import 'package:shop/ui/widgets/profile/profile_screen.dart';

class ScreenIndexModel extends ChangeNotifier {
  int screenIndex = 0;
  int get fetchCurrentScreenIndex {
    return screenIndex;
  }

  void updateScreenIndex(int newIndex) {
    screenIndex = newIndex;
    notifyListeners();
  }
}

class HomeScreen extends StatelessWidget {
  List<dynamic> screens = const [
    ProductGroupListScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenIndexModel = Provider.of<ScreenIndexModel>(context);
    int currentScreenIndex = _screenIndexModel.fetchCurrentScreenIndex;
    return Scaffold(
      body: screens[currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        elevation: 1.5,
        currentIndex: currentScreenIndex,
        onTap: (value) => _screenIndexModel.updateScreenIndex(value),
        items: [
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                  (currentScreenIndex == 0) ? Icons.home : Icons.home_outlined),
              backgroundColor: AppColors.mainWhite),
          BottomNavigationBarItem(
            label: '',
            icon: Icon((currentScreenIndex == 1)
                ? Icons.shopping_cart
                : Icons.shopping_cart_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon((currentScreenIndex == 2)
                ? Icons.account_circle
                : Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }
}
