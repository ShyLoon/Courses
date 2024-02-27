import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pro_courses_sv/dj/service.dart';
import 'package:pro_courses_sv/features/RegistrationAutorize/presentation/controller/user_controller.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late final UserController userController;

  LoginScreen() {
    userController = service<UserController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Авторизация'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _loginController,
              decoration: InputDecoration(
                labelText: 'Логин',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Пароль',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _loginPressed(context);
              },
              child: Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }

  void _loginPressed(BuildContext context) async {
    final String login = _loginController.text.trim();
    final String password = _passwordController.text.trim();

    final result = await userController.authenticateUser(login, password);

    if (result.success) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result.message),
        duration: Duration(seconds: 2),
      ));

      service<GoRouter>().go('/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result.message),
        duration: Duration(seconds: 2),
      ));
    }
  }
}
