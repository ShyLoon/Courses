import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pro_courses_sv/core/interceptor_app.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:pro_courses_sv/features/Home/presentation/ui/home_screen.dart';
import 'package:pro_courses_sv/features/RegistrationAutorize/presentation/controller/user_controller.dart';
import 'package:pro_courses_sv/features/RegistrationAutorize/presentation/ui/autorization_screen.dart';
import 'package:pro_courses_sv/features/RegistrationAutorize/presentation/ui/registration_screen.dart';

final service = GetIt.instance;

Future<void> init() async {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.0.103:5207/',
    ),
  );
  dio.interceptors.add(InterceptorsApp());
  dio.interceptors.add(PrettyDioLogger());
  service.registerLazySingleton<Dio>(() => dio);
  service.registerLazySingleton<UserController>(() => UserController(service<Dio>()));

  final router = GoRouter(
    initialLocation: '/registration',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => RegistrationScreen(),
        ),
      GoRoute(
        path: '/home',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/registration',
        builder: (context, state) => RegistrationScreen(),
      )
    ],
  );
  service.registerSingleton<GoRouter>(router);


}