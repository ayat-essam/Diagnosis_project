// import 'package:diagnosis_project/Feature/Consultations/Data/models/modifey_con_request.dart';
// import 'package:dio/dio.dart';
// import 'package:retrofit/http.dart';
// import '../../Feature/Consultations/Data/models/accept_con_request.dart';
// import '../../Feature/Consultations/Data/models/rejected_consultation_request .dart';
// import '../constants/api_constant.dart';
//
// part 'api_services.g.dart';
//
// @RestApi(baseUrl: ApiConstants.baseURL)
// abstract class ApiServices {
//   factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;
//
//   @POST(ApiConstants.consultationAccept)
//   Future<AcceptResponse> acceptConsultation(
//       @Path('consultationId') int consultationId,
//       @Body() RejectedResponse body,
//       );
//
//   @POST(ApiConstants.consultationRejected)
//   Future<RejectedResponse> rejectConsultation(
//       @Path('consultationId') int consultationId,
//       @Body() RejectedResponse body,
//       );
//
//   Future<ModifyResponse> ModifeyConsultarion(
//       @Path("consultationId") int consultationId,
//       @Body() RejectedResponse body,
//       );
// }