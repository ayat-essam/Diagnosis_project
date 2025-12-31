import 'package:diagnosis_project/Feature/Inquiries/data/models/create_inquiry_request.dart';
import 'package:diagnosis_project/Feature/Inquiries/data/models/inquiry_details_model.dart';
import 'package:diagnosis_project/Feature/Inquiries/data/models/inquiry_model.dart';

abstract class InquiryRemoteDataSource {
  Future<void> createInquiry({required CreateInquiryRequest request});

  Future<List<InquiryModel>> getPatientInquiries();

  Future<InquiryDetailsModel> getInquiryDetails({
    required int inquiryId,
  });
}
