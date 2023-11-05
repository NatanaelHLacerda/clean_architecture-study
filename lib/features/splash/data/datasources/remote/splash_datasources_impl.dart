import 'package:injector/core/routes/const_routes.dart';
import 'package:injector/core/service/auth_service.dart';
import 'package:injector/features/splash/data/datasources/splash_datasources.dart';

class SplashDatasourcesImpl implements SplashDatasources {
  final AuthService auth;
  final ConstRoutes routes;

  SplashDatasourcesImpl(
    this.auth,
    this.routes,
  );

  @override
  Future<String> credentialValidation() async {
    if (auth.instance.currentUser != null) {
      return routes.homeView;
    }
    return routes.loginView;
  }
}
