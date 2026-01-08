import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Inquiries/data/models/create_inquiry_request.dart';
import 'package:diagnosis_project/Feature/Inquiries/domain/entities/inquiry_details_entity.dart';
import 'package:diagnosis_project/Feature/Inquiries/domain/entities/inquiry_entity.dart';

abstract class InquiryRepository {
  Future<Either<ErrorModel, String>> createInquiry(
      {required CreateInquiryRequest createInquiryRequest});
  Future<Either<ErrorModel, List<InquiryEntity>>> getPatientInquiries();
  Future<Either<ErrorModel, InquiryDetailsEntity>> getInquiryDetails(
      {required int inquiryId});
}
