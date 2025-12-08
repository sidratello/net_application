part of 'resendotp_cubit.dart';

sealed class ResendotpState extends Equatable {
  const ResendotpState();

  @override
  List<Object> get props => [];
}

final class ResendotpInitial extends ResendotpState {}


class ResendotpLoading extends ResendotpState {}

class ResendotpSuccess extends ResendotpState {
  final String message;
 
  const ResendotpSuccess({required this.message});

}

class ResendotpFailure extends ResendotpState {
  final String errMessage;
  const ResendotpFailure(this.errMessage);

}