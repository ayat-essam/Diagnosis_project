import 'package:diagnosis_project/Feature/Inquiries/data/models/create_inquiry_request.dart';
import 'package:diagnosis_project/Feature/Inquiries/domain/repository/inquiry_repository.dart';

class CreateInquiryUseCase {
  final InquiryRepository repository;

  CreateInquiryUseCase(this.repository);

  Future<void> call({required CreateInquiryRequest createInquiryRequest}) {
    return repository.createInquiry(createInquiryRequest: createInquiryRequest);
  }
}
