import 'package:flutter/material.dart';
import 'package:shop/domain/data_providers/user_data_provider.dart';
import 'package:shop/domain/services/auth_service.dart';
import 'package:shop/ui/navigation/main_navigation.dart';

class ProfileModel extends ChangeNotifier {
  final _authService = AuthService();
  final user = UserDataProvider().loadValue();

  Future<void> onLogoutPressed(BuildContext context) async {
    await _authService.logout();
    MainNavigation.showLoader(context);
  }

}