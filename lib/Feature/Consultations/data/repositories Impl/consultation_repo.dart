// import 'package:diagnosis_project/Feature/Consultations/Data/Mapper/consultation_mapper.dart';
// import 'package:diagnosis_project/core/network/api_handele_error.dart';
// import 'package:dio/dio.dart';
// import 'package:diagnosis_project/core/network/api_result.dart';
// import '../../../../Core/constants/api_constant.dart';
// import '../../Domain/repos/consultations_repo.dart';
// import '../../domain/entity/consultation.dart';
// import '../models/accept_con_request.dart';
// import '../models/conultation_model.dart';
// import '../models/modifey_con_request.dart';
// import '../models/modify_response.dart';
// import '../models/reject_response.dart';
//
// class ConsultationRepositoryImpl implements ConsultationRepository {
//   final Dio dio;
//
//   ConsultationRepositoryImpl(this.dio);
//
//   @override
//   Future<ApiResult<Consultation>> getConsultationDetails(int id) async {
//     try {
//       final response = await dio.get(
//         '${ApiConstants.consultationDetails}/$id',
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//           },
//         ),
//       );
//
//       if (response.statusCode == 200) {
//         final model = ConsultationModel.fromJson(response.data);
//         final consultation = model.toEntity;
//
//         if (consultation.success) {
//           return ApiResult.success(consultation as Consultation);
//         } else {
//           return ApiResult.failure(
//             ErrorHandler.fromMessage('Error message', statusCode: 400),
//           );
//         }
//       } else {
//         return ApiResult.failure(
//         ErrorHandler.fromMessage('Error message', statusCode: 400),
//
//         );
//       }
//     } on DioException catch (e) {
//       return ApiResult.failure(_handleDioError(e));
//     } catch (e) {
//       return ApiResult.failure(
//         ErrorHandler.fromMessage(e.toString(), statusCode: 500),
//       );
//     }
//   }
//
//   @override
//   Future<ApiResult<List<Consultation>>> getAllConsultations() async {
//     try {
//       final response = await dio.get(
//         ApiConstants.consultationList,
//         options: Options(
//           headers: {'Content-Type': 'application/json'},
//         ),
//       );
//
//       if (response.statusCode == 200) {
//         List<dynamic> data;
//
//         if (response.data is Map) {
//           final responseMap = response.data as Map<String, dynamic>;
//
//           if (responseMap.containsKey('success') && responseMap['success'] == false) {
//             return ApiResult.failure(
//     ErrorHandler.fromMessage('Error message', statusCode: 400),
//
//             );
//           }
//
//           if (responseMap.containsKey('consultations')) {
//             data = responseMap['consultations'] as List<dynamic>;
//           } else if (responseMap.containsKey('data')) {
//             data = responseMap['data'] as List<dynamic>;
//           } else {
//             data = [];
//           }
//         } else if (response.data is List) {
//           data = response.data as List<dynamic>;
//         } else {
//     return ApiResult.failure(
//     ErrorHandler.fromMessage('Error message', statusCode: 400),
//     );
//         }
//
//         final models = data
//             .map((json) => ConsultationModel.fromJson(json))
//             .toList();
//
//         final consultations = models.toEntities;
//
//         return ApiResult.success(consultations);
//       } else {
//     return ApiResult.failure(
//     ErrorHandler.fromMessage('Error message', statusCode: 400),
//         );
//       }
//     } on DioException catch (e) {
//       return ApiResult.failure(_handleDioError(e));
//     } catch (e) {
//     return ApiResult.failure(
//     ErrorHandler.fromMessage('Error message', statusCode: 400),
//     );
//     }
//   }
//
//   @override
//   Future<ApiResult<List<Consultation>>> getConsultationsByDoctor({
//     required int doctorId,
//     int page = 1,
//     int limit = 10,
//   }) async {
//     try {
//       final response = await dio.get(
//         ApiConstants.consultationByDoctor,
//         queryParameters: {
//           'doctorId': doctorId,
//           'page': page,
//           'limit': limit,
//         },
//         options: Options(
//           headers: {'Content-Type': 'application/json'},
//         ),
//       );
//
//       if (response.statusCode == 200) {
//         List<dynamic> data;
//
//         if (response.data is Map && response.data.containsKey('consultations')) {
//           data = response.data['consultations'] as List<dynamic>;
//         } else if (response.data is List) {
//           data = response.data as List<dynamic>;
//         } else {
//           return ApiResult.failure(
//             ErrorHandler.fromMessage('Error message', statusCode: 400),
//           );
//         }
//
//         final models = data
//             .map((json) => ConsultationModel.fromJson(json))
//             .toList();
//
//         final consultations = models.toEntities;
//
//         return ApiResult.success(consultations);
//       } else {
//         return ApiResult.failure(
//           ErrorHandler.fromMessage('Error message', statusCode: 400),
//         );
//       }
//     } on DioException catch (e) {
//       return ApiResult.failure(_handleDioError(e));
//     } catch (e) {
//       return ApiResult.failure(
//         ErrorHandler.fromMessage('Error message', statusCode: 400),
//       );
//     }
//   }
//
//   @override
//   Future<ApiResult<AcceptResponse>> acceptConsultation({
//     required int consultationId,
//     required int doctorId,
//     String? diagnosis,
//     String? notes,
//   }) async {
//     try {
//       final request = AcceptConsultationRequest(
//         reason: diagnosis,
//         notes: notes,
//       );
//
//       final response = await dio.post(
//         '${ApiConstants.consultationAccept}/$consultationId',
//         data: request.toJson(),
//         options: Options(
//           headers: {'Content-Type': 'application/json'},
//         ),
//       );
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final acceptResponse = AcceptResponse.fromJson(response.data);
//
//         if (acceptResponse.success == true) {
//           return ApiResult.success(acceptResponse);
//         } else {
//           return ApiResult.failure(
//             ErrorHandler.fromMessage('Error message', statusCode: 400),
//           );
//         }
//       } else {
//         return ApiResult.failure(
//           ErrorHandler.fromMessage('Error message', statusCode: 400),
//
//         );
//       }
//     } on DioException catch (e) {
//       return ApiResult.failure(_handleDioError(e));
//     } catch (e) {
//       return ApiResult.failure(
//         ErrorHandler.fromMessage('Error message', statusCode: 400),
//       );
//     }
//   }
//
//   @override
//   Future<ApiResult<RejectResponse>> rejectConsultation({
//     required int consultationId,
//     required int doctorId,
//     required String reason,
//     String? notes,
//   }) async {
//     try {
//       final request = RejectConsultationRequest(
//         reason: reason,
//         notes: notes,
//       );
//
//       final response = await dio.post(
//         '${ApiConstants.consultationReject}/$consultationId',
//         data: request.toJson(),
//         options: Options(
//           headers: {'Content-Type': 'application/json'},
//         ),
//       );
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final rejectResponse = RejectResponse.fromJson(response.data);
//
//         if (rejectResponse.success == true) {
//           return ApiResult.success(rejectResponse);
//         } else {
//           return ApiResult.failure(
//             ErrorHandler(
//               message: rejectResponse.errorMessage ?? 'Reject action failed',
//               statusCode: 400,
//               data: response.data,
//             ),
//           );
//         }
//       } else {
//         return ApiResult.failure(
//           ErrorHandler.fromMessage('Error message', statusCode: 400),
//         );
//       }
//     } on DioException catch (e) {
//       return ApiResult.failure(_handleDioError(e));
//     } catch (e) {
//       return ApiResult.failure(
//         ErrorHandler(
//           message: e.toString(),
//           statusCode: 500,
//         ),
//       );
//     }
//   }
//
//   @override
//   Future<ApiResult<ModifyResponse>> modifyConsultation({
//     required int consultationId,
//     required int doctorId,
//     String? symptoms,
//     String? diagnosis,
//     String? notes,
//     required String modificationReason,
//   }) async {
//     try {
//       final request = ModifyResponse(
//         consultationId: consultationId,
//        notes:
//       );
//
//       final response = await dio.post(
//         '${ApiConstants.consultationModify}/$consultationId',
//         data: request.toJson(),
//         options: Options(
//           headers: {'Content-Type': 'application/json'},
//         ),
//       );
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final modifyResponse = ModifyResponse.fromJson(response.data);
//
//         if (modifyResponse.success == true) {
//           return ApiResult.success(modifyResponse);
//         } else {
//           return ApiResult.failure(
//             ErrorHandler.fromMessage('Error message', statusCode: 400),
//           );
//         }
//       } else {
//         return ApiResult.failure(
//           ErrorHandler.fromMessage('Error message', statusCode: 400),
//         );
//       }
//     } on DioException catch (e) {
//       return ApiResult.failure(_handleDioError(e));
//     } catch (e) {
//       return ApiResult.failure(
//         ErrorHandler.fromMessage('Error message', statusCode: 400),
//       );
//     }
//   }
//
//   @override
//   Future<ApiResult<List<Consultation>>> searchConsultations({
//     String? query,
//     String? status,
//     DateTime? fromDate,
//     DateTime? toDate,
//   }) async {
//     try {
//       final Map<String, dynamic> queryParams = {};
//
//       if (query != null && query.isNotEmpty) {
//         queryParams['query'] = query;
//       }
//       if (status != null && status.isNotEmpty) {
//         queryParams['status'] = status;
//       }
//       if (fromDate != null) {
//         queryParams['fromDate'] = fromDate.toIso8601String();
//       }
//       if (toDate != null) {
//         queryParams['toDate'] = toDate.toIso8601String();
//       }
//
//       final response = await dio.get(
//         ApiConstants.consultationSearch,
//         queryParameters: queryParams,
//         options: Options(
//           headers: {'Content-Type': 'application/json'},
//         ),
//       );
//
//       if (response.statusCode == 200) {
//         List<dynamic> data;
//
//         if (response.data is Map && response.data.containsKey('consultations')) {
//           data = response.data['consultations'] as List<dynamic>;
//         } else if (response.data is List) {
//           data = response.data as List<dynamic>;
//         } else {
//           return ApiResult.failure(
//             ErrorHandler.fromMessage('Error message', statusCode: 400),
//           );
//         }
//
//         final models = data
//             .map((json) => ConsultationModel.fromJson(json))
//             .toList();
//
//         final consultations = models.toEntities;
//
//         return ApiResult.success(consultations);
//       } else {
//         return ApiResult.failure(
//           ErrorHandler.fromMessage('Error message', statusCode: 400),
//         );
//       }
//     } on DioException catch (e) {
//       return ApiResult.failure(_handleDioError(e));
//     } catch (e) {
//       return ApiResult.failure(
//         ErrorHandler.fromMessage(e.toString(), statusCode: 400),
//       );
//     }
//   }
//
//   ApiResult _handleDioError(DioException e) {
//     final statusCode = e.response?.statusCode ?? 500;
//
//     String errorMessage;
//     dynamic errorData;
//
//     if (e.response?.data != null) {
//       if (e.response!.data is Map && e.response!.data.containsKey('errorMessage')) {
//         errorMessage = e.response!.data['errorMessage'] as String;
//         errorData = e.response!.data;
//       } else if (e.response!.data is String) {
//         errorMessage = e.response!.data as String;
//       } else {
//         errorMessage = e.message ?? 'Network error occurred';
//         errorData = e.response!.data;
//       }
//     } else {
//       errorMessage = e.message ?? 'Network error occurred';
//     }
//
//     switch (e.type) {
//       case DioExceptionType.connectionTimeout:
//         errorMessage = 'Connection timeout. Please check your internet connection.';
//         break;
//       case DioExceptionType.sendTimeout:
//         errorMessage = 'Send timeout. Please try again.';
//         break;
//       case DioExceptionType.receiveTimeout:
//         errorMessage = 'Receive timeout. Server is taking too long to respond.';
//         break;
//       case DioExceptionType.badCertificate:
//         errorMessage = 'Certificate error. Please contact support.';
//         break;
//       case DioExceptionType.badResponse:
//         break;
//       case DioExceptionType.cancel:
//         errorMessage = 'Request was cancelled.';
//         break;
//       case DioExceptionType.connectionError:
//         errorMessage = 'Connection error. Please check your internet connection.';
//         break;
//       case DioExceptionType.unknown:
//         errorMessage = 'Unknown error occurred.';
//         break;
//     }
//
//     return ApiResult.failure(
//       ErrorHandler.fromMessage('Error message', statusCode: 400),
//     );
//   }
// }