import 'package:get_it/get_it.dart';
import 'package:injector/core/routes/const_routes.dart';
import 'package:injector/core/service/auth_service.dart';
import 'package:injector/core/service/database_service.dart';
import 'package:injector/features/home/data/datasources/home_datasources.dart';
import 'package:injector/features/home/data/datasources/remote/home_datasources_impl.dart';
import 'package:injector/features/home/data/repositories/home_repository_impl.dart';
import 'package:injector/features/home/domain/repositories/home_repository.dart';
import 'package:injector/features/home/domain/usecases/add_contact_usecase.dart';
import 'package:injector/features/home/domain/usecases/add_contact_usecase_impl.dart';
import 'package:injector/features/home/domain/usecases/delete_contact_usecase.dart';
import 'package:injector/features/home/domain/usecases/delete_contact_usecase_impl.dart';
import 'package:injector/features/home/domain/usecases/edit_contact_usecase.dart';
import 'package:injector/features/home/domain/usecases/edit_contact_usecase_impl.dart';
import 'package:injector/features/home/domain/usecases/get_contacts_usecase.dart';
import 'package:injector/features/home/domain/usecases/get_contacts_usecase_impl.dart';
import 'package:injector/features/home/domain/usecases/sign_out_usecase.dart';
import 'package:injector/features/home/domain/usecases/sign_out_usecase_impl.dart';
import 'package:injector/features/home/presentation/bloc/home_bloc.dart';
import 'package:injector/features/login/data/datasources/login_datasource.dart';
import 'package:injector/features/login/data/datasources/remote/login_datasources_impl.dart';
import 'package:injector/features/login/data/repositories/login_repository_impl.dart';
import 'package:injector/features/login/domain/repositories/login_repository.dart';
import 'package:injector/features/login/domain/usecases/sign_in_usecase.dart';
import 'package:injector/features/login/domain/usecases/sign_in_usecase_impl.dart';
import 'package:injector/features/login/presentation/bloc/login_bloc.dart';
import 'package:injector/features/register/data/datasources/register_datasource.dart';
import 'package:injector/features/register/data/datasources/remote/register_datasource_impl.dart';
import 'package:injector/features/register/data/repositories/register_repository_impl.dart';
import 'package:injector/features/register/domain/repositories/register_repository.dart';
import 'package:injector/features/register/domain/usecases/sign_up_usecase.dart';
import 'package:injector/features/register/domain/usecases/sign_up_usecase_impl.dart';
import 'package:injector/features/register/presentation/bloc/register_bloc.dart';
import 'package:injector/features/splash/data/datasources/remote/splash_datasources_impl.dart';
import 'package:injector/features/splash/data/datasources/splash_datasources.dart';
import 'package:injector/features/splash/data/repositories/splash_repository_impl.dart';
import 'package:injector/features/splash/domain/repositories/splash_repository.dart';
import 'package:injector/features/splash/domain/usecases/credential_validator_usecase.dart';
import 'package:injector/features/splash/domain/usecases/credential_validator_usecase_impl.dart';
import 'package:injector/features/splash/presentation/bloc/splash_bloc.dart';

class AppInjector {
  static initialize() {
    GetIt getIt = GetIt.instance;

    // Core

    getIt.registerLazySingleton(() => ConstRoutes());
    getIt.registerLazySingleton(() => AuthService());
    getIt.registerLazySingleton(() => DatabaseService());

    // datasources

    getIt.registerLazySingleton<SplashDatasources>(
        () => SplashDatasourcesImpl(getIt(), getIt()));
    getIt.registerLazySingleton<LoginDatasources>(
        () => LoginDatasourcesImpl(getIt()));
    getIt.registerLazySingleton<RegisterDatasource>(
        () => RegisterDatasourceImpl(getIt(), getIt()));
    getIt.registerLazySingleton<HomeDataSources>(() => HomeDataSourcesImpl(getIt(), getIt()));

    // repositories

    getIt.registerLazySingleton<SplashRepository>(
        () => SplashRepositoryImpl(getIt()));

    getIt.registerLazySingleton<LoginRepository>(
        () => LoginRepositoryImpl(getIt()));
    getIt.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(getIt()));
    getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(getIt()));

    // usecases

    getIt.registerLazySingleton<CredentialValidatorUsecase>(
        () => CredentialValidatorUsecaseImpl(getIt()));
    getIt
        .registerLazySingleton<SignInUsecase>(() => SignInUsecaseImpl(getIt()));
    getIt.registerLazySingleton<SignUpUsecase>(() => SignUpUsecaseImpl(getIt()));
    getIt.registerLazySingleton<SignOutUsecase>(() => SignOutUsecaseImpl(getIt()));

    getIt.registerLazySingleton<AddContactUsecase>(() => AddContactUsecaseImpl(getIt()));

    getIt.registerLazySingleton<GetContactsUsecase>(() => GetContactsUsecaseImpl(getIt()));

    getIt.registerLazySingleton<EditContactUsecase>(() => EditContactUsecaseImpl(getIt()));

    getIt.registerLazySingleton<DeleteContactUsecase>(() => DeleteContactUsecaseImpl(getIt()));

    // BLOC

    getIt.registerFactory(() => SplashBloc(getIt()));
    getIt.registerFactory(() => LoginBloc(getIt()));
    getIt.registerFactory(() => RegisterBloc(getIt()));
    getIt.registerFactory(() => HomeBloc(getIt(), getIt(), getIt(), getIt(), getIt()));
  }
}
