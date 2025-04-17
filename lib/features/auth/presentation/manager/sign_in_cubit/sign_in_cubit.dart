import 'package:bloc/bloc.dart';
import 'package:ev_charging/features/auth/domain/entities/user_entity.dart';
import 'package:ev_charging/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(SignInLoading());
    final result = await authRepo.signInWithEmailAndPassword(
        email: email, password: password);
    result.fold(
      (failure) => emit(SignInFailure(message: failure.errMessage)),
      (userEntity) => emit(SignInSuccess(userEntity: userEntity)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(SignInFailure(message: failure.errMessage)),
      (userEntity) => emit(SignInSuccess(userEntity: userEntity)),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(SignInFailure(message: failure.errMessage)),
      (userEntity) => emit(SignInSuccess(userEntity: userEntity)),
    );
  }
}
