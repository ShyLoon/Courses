import 'package:dio/dio.dart';
import 'package:pro_courses_sv/features/RegistrationAutorize/domain/models/user_model.dart';

class UserController {
  final Dio _dio;

  UserController(this._dio);

  Future<RegistrationResult> registerUser(User user) async {
    try {
      final response = await _dio.post(
        'api/Clients/sign_up',
        data: {
          'idClient': user.idClient,
          'nameClient': user.nameClient,
          'surnameClient': user.surnameClient,
          'loginClient': user.loginClient,
          'phoneNumberClient': user.phoneNumberClient,
          'emailClient': user.emailClient,
          'passwordClient': user.passwordClient,
          'salt': user.salt,
          'passportNumberClient': user.passportNumberClient,
          'passportSeriesClient': user.passportSeriesClient,
        },
      );

      if (response.statusCode == 200) {
        return RegistrationResult(success: true, message: "Вы успешно зарегистрировались");
      } else {
        return RegistrationResult(success: false, message: "Ошибка при регистрации.");
      }
    } catch (e) {
      return RegistrationResult(success: false, message: "Ошибка при регистрации: $e");
    }
  }

  Future<RegistrationResult> authenticateUser(String login, String password) async {
    try {
      final response = await _dio.post(
        'api/Clients/sign_in',
        data: {
          'loginClient': login,
          'passwordClient': password,
        },
      );

      if (response.statusCode == 200) {
        return RegistrationResult(success: true, message: "Вы успешно авторизовались");
      } else {
        return RegistrationResult(success: false, message: "Ошибка при авторизации.");
      }
    } catch (e) {
      return RegistrationResult(success: false, message: "Ошибка при авторизации: $e");
    }
  }




}




class RegistrationResult {
  final bool success;
  final String message;

  RegistrationResult({required this.success, required this.message});
}