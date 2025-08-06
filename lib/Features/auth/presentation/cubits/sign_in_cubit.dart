import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repos/auth_repo.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    final result = await authRepo.signInWithEmailAndPassword(
      email,
      password,
    );
    result.fold(
      (l) => emit(SignInFailure(l.message)),
      (r) => emit(SignInSuccess(r)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (l) => emit(SignInFailure(l.message)),
      (r) => emit(SignInSuccess(r)),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold(
      (l) => emit(SignInFailure(l.message)),
      (r) => emit(SignInSuccess(r)),
    );
  }
}
