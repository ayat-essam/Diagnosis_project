import '../../domain/entities/doctor_entity.dart';

abstract class DoctorListState {}

class DoctorListInitial extends DoctorListState {}

class DoctorListLoading extends DoctorListState {}

class DoctorListSuccess extends DoctorListState {
  final List<DoctorEntity> doctors;
  DoctorListSuccess(this.doctors);
}

class DoctorListError extends DoctorListState {
  final String message;
  DoctorListError(this.message);
}
