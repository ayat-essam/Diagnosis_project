import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Inquiries/domain/entities/inquiry_details_entity.dart';
import 'package:diagnosis_project/Feature/Inquiries/domain/repository/inquiry_repository.dart';

class GetInquiryDetailsUseCase {
  final InquiryRepository repository;

  GetInquiryDetailsUseCase(this.repository);

  Future<Either<ErrorModel, InquiryDetailsEntity>> call({
    required int patientId,
    required int inquiryId,
  }) {
    return repository.getInquiryDetails(
        patientId: patientId, inquiryId: inquiryId);
  }
}
