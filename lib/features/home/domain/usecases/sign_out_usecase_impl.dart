import 'package:injector/features/home/domain/repositories/home_repository.dart';
import 'package:injector/features/home/domain/usecases/sign_out_usecase.dart';

class SignOutUsecaseImpl implements SignOutUsecase{
  final HomeRepository homeRepository;
  SignOutUsecaseImpl(this.homeRepository);


  @override
  Future<void> signOut() {
    return homeRepository.signOut();
  }

}