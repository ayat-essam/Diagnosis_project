import 'package:diagnosis_project/Core/api/api_consumer.dart';
import 'package:diagnosis_project/Core/utils/file_to_multipart_helper.dart';
import 'package:diagnosis_project/Feature/Inquiries/data/datasource/inquiry_remote_datasource.dart';
import 'package:diagnosis_project/Feature/Inquiries/data/models/create_inquiry_request.dart';
import 'package:diagnosis_project/Feature/Inquiries/data/models/inquiry_details_model.dart';
import 'package:diagnosis_project/Feature/Inquiries/data/models/inquiry_model.dart';
import 'package:dio/dio.dart';

class InquiryRemoteDataSourceImpl implements InquiryRemoteDataSource {
  final ApiConsumer apiConsumer;

  InquiryRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<void> createInquiry({required CreateInquiryRequest request}) async {
    final formData = FormData.fromMap({
      'patientId': request.patientId,
      'doctorId': request.doctorId,
      'symptoms': request.symptoms ?? '',
      'notes': request.notes ?? '',
      'files': request.files != null ? filesToMultipart(request.files!) : [],
    });
    await apiConsumer.post('/Inquiry', data: formData, isFormData: true);
  }

  @override
  Future<InquiryDetailsModel> getInquiryDetails(
      {required int patientId, required int inquiryId}) async {
    final response = await apiConsumer.get(
      '/Inquiry',
      queryParameters: {
        'patientId': patientId,
        'inquiryId': inquiryId,
      },
    );
    return InquiryDetailsModel.fromJson(response);
  }

  @override
  Future<List<InquiryModel>> getPatientInquiries(
      {required int patientId}) async {
    final response = await apiConsumer.get('/Inquiry/inquiries/$patientId');
    return List<InquiryModel>.from(
        response.map((i) => InquiryModel.fromJson(i)));
  }
}
