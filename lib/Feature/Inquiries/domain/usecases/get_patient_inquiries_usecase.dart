import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Inquiries/domain/entities/inquiry_entity.dart';
import 'package:diagnosis_project/Feature/Inquiries/domain/repository/inquiry_repository.dart';
import 'package:injectable/injectable.dart';
class GetPatientInquiriesUseCase {
  final InquiryRepository repository;

  GetPatientInquiriesUseCase(this.repository);

  Future<Either<ErrorModel, List<InquiryEntity>>> call({required int patientId}) {
    return repository.getPatientInquiries(patientId: patientId);
  }
}
