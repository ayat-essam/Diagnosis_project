import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Core/error/exceptions.dart';
import 'package:diagnosis_project/Feature/Inquiries/data/datasource/inquiry_remote_datasource.dart';
import 'package:diagnosis_project/Feature/Inquiries/data/models/create_inquiry_request.dart';
import 'package:diagnosis_project/Feature/Inquiries/domain/entities/inquiry_details_entity.dart';
import 'package:diagnosis_project/Feature/Inquiries/domain/entities/inquiry_entity.dart';
import 'package:diagnosis_project/Feature/Inquiries/domain/repository/inquiry_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: InquiryRepository)
class InquiryRepositoryImpl implements InquiryRepository {
  final InquiryRemoteDataSource inquiryRemoteDataSource;
  InquiryRepositoryImpl({required this.inquiryRemoteDataSource});
  @override
  Future<Either<ErrorModel, String>> createInquiry(
      {required CreateInquiryRequest createInquiryRequest}) async {
    try {
      await inquiryRemoteDataSource.createInquiry(
          request: createInquiryRequest);
      return const Right('Inquiry submitted successfully');
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, InquiryDetailsEntity>> getInquiryDetails(
      {required int patientId, required int inquiryId}) async {
    try {
      final response = await inquiryRemoteDataSource.getInquiryDetails(
          patientId: patientId, inquiryId: inquiryId);
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, List<InquiryEntity>>> getPatientInquiries() async {
    try {
      final response = await inquiryRemoteDataSource.getPatientInquiries();
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
