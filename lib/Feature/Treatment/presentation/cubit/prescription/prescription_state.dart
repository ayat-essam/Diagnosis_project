part of 'prescription_cubit.dart';

@immutable
abstract class AddPrescriptionState {}

class AddPrescriptionInitial extends AddPrescriptionState {}

class AddPrescriptionLoading extends AddPrescriptionState {}

class AddPrescriptionSuccess extends AddPrescriptionState {}
class AddPrescriptionAuthExpired extends AddPrescriptionState{}
class AddPrescriptionError extends AddPrescriptionState {
  final String message;
  AddPrescriptionError(this.message);
}
