import 'package:diagnosis_project/Feature/Inquiries/domain/entities/inquiry_details_entity.dart';

abstract class InquiryDetailsState {}

class InquiryDetailsInitial extends InquiryDetailsState {}

class InquiryDetailsLoading extends InquiryDetailsState {}

class InquiryDetailsSuccess extends InquiryDetailsState {
  final InquiryDetailsEntity inquiryDetails;

  InquiryDetailsSuccess({required this.inquiryDetails});
}

class InquiryDetailsError extends InquiryDetailsState {
  final String error;

  InquiryDetailsError({required this.error});
}
