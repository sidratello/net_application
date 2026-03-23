part of 'otp_cubit.dart';

sealed class OtpcubitState extends Equatable {
  const OtpcubitState();

  @override
  List<Object> get props => [];
}

final class OtpcubitInitial extends OtpcubitState {}






class otpnInitial extends OtpcubitState {}

class otpLoading extends OtpcubitState {}

class otrpSuccess extends OtpcubitState {
  final String message;
 
  const otrpSuccess({required this.message});

}

class otpFailure extends OtpcubitState {
  final String errMessage;
  const otpFailure(this.errMessage);

}