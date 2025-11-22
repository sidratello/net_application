part of 'signup_cubit.dart';

sealed class signupState extends Equatable {
  const signupState();

  @override
  List<Object> get props => [];
}

final class signupInitial extends signupState {}

class signInitial extends signupState {}

class signupLoading extends signupState {}

class signupSuccess extends signupState {
  final String message;
 
  const signupSuccess({required this.message});

}

class signupFailure extends signupState {
  final String errMessage;
  const signupFailure(this.errMessage);

}