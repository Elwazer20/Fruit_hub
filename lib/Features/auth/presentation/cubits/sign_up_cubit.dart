import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entity/user_entity.dart';
import '../../domain/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    emit(SignUpLoading());
    final result =
        await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold(
      (l) => emit(SignUpFailure(l.message)),
      (r) => emit(SignUpSuccess(r)),
    );
  }
}
