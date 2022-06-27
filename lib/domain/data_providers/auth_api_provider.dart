abstract class AuthApiProviderError {}

class AuthApiProviderIncorectLoginDataError {}

class AuthApiProvider {
  Future<String> login(String login, String password) async {
    final isSuccess = login == 'admin' && password == '12345678';
    if (isSuccess) {
      return 'token';
    } else {
      throw AuthApiProviderIncorectLoginDataError();
    }
  }
}