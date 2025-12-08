part of 'complaint_cubit.dart';

@immutable
sealed class ComplaintState {}

final class ComplaintInitial extends ComplaintState {}

final class ComplaintLoading extends ComplaintState {}

final class ComplaintFailure extends ComplaintState {
  final String errorMessage;

  ComplaintFailure({required this.errorMessage});
}

final class ComplaintSuccess extends ComplaintState {}
