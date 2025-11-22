part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}


class loginInitial extends LoginState {}

class loginLoading extends LoginState {}

class loginSuccess extends LoginState {
  final String message;
 
  const loginSuccess({required this.message});

}

class loginFailure extends LoginState {
  final String errMessage;
  const loginFailure(this.errMessage);

}