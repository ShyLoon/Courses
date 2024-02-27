import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pro_courses_sv/dj/service.dart';
import 'package:pro_courses_sv/features/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  final router = service<GoRouter>();
  runApp(MyApp(router: router)); 
}
