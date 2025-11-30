import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:net_aplecation/feature/Auth/data/repos/auth_repo.dart';

part 'resendotp_state.dart';

class ResendotpCubit extends Cubit<ResendotpState> {
  ResendotpCubit(this.authRepo) : super(ResendotpInitial());



  final AuthRepo authRepo;

  Future<void> fetchdataresendotp({
  
    required String email,

  }) async {
    emit(ResendotpLoading());

    final response = await authRepo.fetchdataresendotp(

      Email: email,
   
    );

    response.fold(
      (failure) {
         print('❌resend OTP Failure: ${failure.errMessage}');
        emit(ResendotpFailure(failure.errMessage));
      },
      (data) {
        print('✅ Success: $data');
        final message = data['message'] as String? ?? '';
        emit(ResendotpSuccess(message: message));
      },
    );
  }}