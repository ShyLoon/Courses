import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pro_courses_sv/dj/service.dart';
import 'package:pro_courses_sv/features/Home/presentation/ui/home_screen.dart';
import 'package:pro_courses_sv/features/RegistrationAutorize/presentation/controller/user_controller.dart';
import 'package:pro_courses_sv/features/RegistrationAutorize/presentation/ui/autorization_screen.dart';
import 'package:pro_courses_sv/features/RegistrationAutorize/presentation/ui/registration_screen.dart';

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({required this.router});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationScreen(),
    );
  }
}