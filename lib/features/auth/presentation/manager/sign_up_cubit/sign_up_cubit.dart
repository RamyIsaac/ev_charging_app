import 'package:bloc/bloc.dart';
import 'package:ev_charging/features/auth/domain/entities/user_entity.dart';
import 'package:ev_charging/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    emit(SignUpLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
        email: email, password: password, name: name);
    result.fold(
      (failure) => emit(SignUpFailure(message: failure.errMessage)),
      (userEntity) => emit(
        SignUpSuccess(userEntity: userEntity),
      ),
    );
  }
}
