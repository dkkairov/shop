import 'package:shop/domain/data_providers/user_data_provider.dart';
import 'package:shop/domain/entities/user.dart';

class UserService {
  final _userDataProvider = UserDataProvider();
  late User _user;
  User get user => _user;

  void initialize() {
    _user = _userDataProvider.loadValue();
  }
}