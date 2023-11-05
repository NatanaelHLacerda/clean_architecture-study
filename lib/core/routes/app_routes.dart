import 'package:injector/core/routes/const_routes.dart';
import 'package:injector/features/home/presentation/ui/home_view.dart';
import 'package:injector/features/login/presentation/ui/login_view.dart';
import 'package:injector/features/register/presentation/ui/register_view.dart';
import 'package:injector/features/splash/presentation/ui/splash_view.dart';

class AppRoutes {
  static builder (ConstRoutes routes) {
    return {
      routes.splashView: (_) => const SplashView(),
      routes.loginView: (_) => const LoginView(),
      routes.registerView: (_) => const RegisterView(),
      routes.homeView: (_) => const HomeView(),
    };
  }
}