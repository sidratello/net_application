import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/Auth/data/repos/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<signupState> {
  SignupCubit(this.authRepo) : super(signupInitial());

  final AuthRepo authRepo;

  Future<void> fetchDataSignup({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(signupLoading());

    final response = await authRepo.fetchdatasignup(
      FullName: fullName,
      Email: email,
      password: password,
      ConfirmPassword: confirmPassword,
    );

    response.fold(
      (failure) {
        emit(signupFailure(failure.errMessage));
      },
      (data) {
        print('✅ Success: $data');
        final message = data['message'] as String? ?? '';
        emit(signupSuccess(message: message));
      },
    );
  }
}
