import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pro_courses_sv/dj/service.dart';
import 'package:pro_courses_sv/features/RegistrationAutorize/domain/models/user_model.dart';
import 'package:pro_courses_sv/features/RegistrationAutorize/presentation/controller/user_controller.dart';
import 'package:pro_courses_sv/features/RegistrationAutorize/presentation/ui/autorization_screen.dart';


class RegistrationScreen extends StatefulWidget {

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late final UserController userController;

  @override
  void initState() {
    super.initState();
    userController = service<UserController>();
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Имя'),
            ),
            TextField(
              controller: _surnameController,
              decoration: const InputDecoration(labelText: 'Фамилия'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _loginController,
              decoration: const InputDecoration(labelText: 'Логин'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Пароль'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registerUser,
              child: const Text('Зарегистрироваться'),
            ),
            const SizedBox(height: 10), 
            TextButton( 
              onPressed: () {
                print('Navigating to login screen');
                service<GoRouter>().go('/login');
              },
              child: Text('Уже есть аккаунт? Войти'), 
            ),
          ],
        ),
      ),
    );
  }

  void _registerUser() async {
    final user = User(
      idClient: 0, 
      nameClient: _nameController.text,
      surnameClient: _surnameController.text,
      loginClient: _loginController.text, 
      phoneNumberClient: '', 
      emailClient: _emailController.text,
      passwordClient: _passwordController.text,
      salt: '', 
      passportNumberClient: 0, 
      passportSeriesClient: 0,
    );

    try {
      final result = await userController.registerUser(user);

      if (result.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result.message),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result.message),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Ошибка при регистрации: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ошибка при регистрации: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
