
import '../../domain/entities/inquiry_entity.dart';

abstract class PatientInquiriesState {}

class PatientInquiriesInitial extends PatientInquiriesState {}
class PatientInquiriesLoading extends PatientInquiriesState {}

class PatientInquiriesLoaded extends PatientInquiriesState {
  final List<InquiryEntity> inquiries;

  PatientInquiriesLoaded(this.inquiries);
}

class PatientInquiriesError extends PatientInquiriesState {
  final String error;
  PatientInquiriesError(this.error);
}
