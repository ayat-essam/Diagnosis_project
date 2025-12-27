import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Feature/Inquiries/data/models/create_inquiry_request.dart';
import 'package:diagnosis_project/Feature/Inquiries/domain/repository/inquiry_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../Core/error/error_model.dart';

class CreateInquiryUseCase {
  final InquiryRepository repository;

  CreateInquiryUseCase(this.repository);

  Future<Either<ErrorModel, String>> call({
    required CreateInquiryRequest createInquiryRequest,
  }) {
    return repository.createInquiry(
      createInquiryRequest: createInquiryRequest,
    );
  }
}
