import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../Feature/Consultations/Data/models/consultation_details.dart';
import '../constants/api_constant.dart';

@RestApi(baseUrl: APIConstants.baseURL)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @GET(APIConstants.consultationDetails)
  Future<ResponseConsultationDetails> getConsultationDetails({
    @Query('id') int? consultationId,
    @Query('patientId') int? patientId,
    @Query('doctorId') int? doctorId,
    @Query('date') String? date,
  });
}

// @GET(APIConstants.consultationList)
// Future<ConsultationListResponse> getConsultationList({
//   @Query('page') int page = 1,
//   @Query('limit') int limit = 10,
//   @Query('patientId') int? patientId,
//   @Query('doctorId') int? doctorId,
//   @Query('status') String? status,
//   @Query('startDate') String? startDate,
//   @Query('endDate') String? endDate,
//   @Query('sortBy') String? sortBy,
//   @Query('order') String? order = 'desc',
// });

// @POST(ApiConstants.createConsultation)
// Future<ResponseConsultationDetails> createConsultation(
//     @Body() CreateConsultationRequest request,
//     );
//
// @PUT(ApiConstants.updateConsultation)
// Future<ResponseConsultationDetails> updateConsultation(
//     @Path('id') int consultationId,
//     @Body() Map<String, dynamic> updateData,
//     );
//
// @DELETE('${ApiConstants.deleteConsultation}')
// Future<Map<String, dynamic>> deleteConsultation(
//     @Path('id') int consultationId,
//     );