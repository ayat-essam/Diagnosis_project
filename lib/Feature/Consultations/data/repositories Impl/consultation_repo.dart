
import 'package:dio/dio.dart';
import 'package:diagnosis_project/core/network/api_result.dart';
import '../../domain/entity/consultation.dart';


class ConsultationRepositoryImpl implements ConsultationRepository {
  final Dio dio;

  ConsultationRepositoryImpl(this.dio);

  @override
  Future<ApiResult<Consultation>> getConsultationDetails(int id) async {
    try {
      final response = await dio.get(
        ApiConstants.consultationDetails,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final model = ConsultationModel.fromJson(response.data);
        final consultation = model.toEntity;

        // تحقق من حقل success في الـ response
        if (consultation.success) {
          return ApiResult.success(consultation);
        } else {
          return ApiResult.failure(
            ErrorHandler(
              message: consultation.errorMessage ?? 'API returned success: false',
              statusCode: 400,
              data: response.data,
            ),
          );
        }
      } else {
        return ApiResult.failure(
          ErrorHandler(
            message: response.data['errorMessage'] ?? 'Failed to load consultation',
            statusCode: response.statusCode ?? 500,
            data: response.data,
          ),
        );
      }
    } on DioException catch (e) {
      return ApiResult.failure(_handleDioError(e));
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler(
          message: e.toString(),
          statusCode: 500,
        ),
      );
    }
  }

  // ============ GET ALL CONSULTATIONS ============
  @override
  Future<ApiResult<List<Consultation>>> getAllConsultations() async {
    try {
      final response = await dio.get(
        '/Consultation/list',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        // تحقق من شكل الـ response
        List<dynamic> data;

        if (response.data is Map && response.data.containsKey('consultations')) {
          data = response.data['consultations'] as List<dynamic>;
        } else if (response.data is List) {
          data = response.data as List<dynamic>;
        } else {
          return ApiResult.failure(
            ErrorHandler(
              message: 'Invalid response format',
              statusCode: 500,
              data: response.data,
            ),
          );
        }

        final models = data
            .map((json) => ConsultationModel.fromJson(json))
            .toList();

        final consultations = models.toEntities;

        return ApiResult.success(consultations);
      } else {
        return ApiResult.failure(
          ErrorHandler(
            message: response.data['errorMessage'] ?? 'Failed to load consultations',
            statusCode: response.statusCode ?? 500,
            data: response.data,
          ),
        );
      }
    } on DioException catch (e) {
      return ApiResult.failure(_handleDioError(e));
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler(
          message: e.toString(),
          statusCode: 500,
        ),
      );
    }
  }

  // ============ GET CONSULTATIONS BY DOCTOR ============
  @override
  Future<ApiResult<List<Consultation>>> getConsultationsByDoctor({
    required int doctorId,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await dio.get(
        '/Consultation/ByDoctor',
        queryParameters: {
          'doctorId': doctorId,
          'page': page,
          'limit': limit,
        },
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data;

        if (response.data is Map && response.data.containsKey('consultations')) {
          data = response.data['consultations'] as List<dynamic>;
        } else if (response.data is List) {
          data = response.data as List<dynamic>;
        } else {
          return ApiResult.failure(
            ErrorHandler(
              message: 'Invalid response format',
              statusCode: 500,
              data: response.data,
            ),
          );
        }

        final models = data
            .map((json) => ConsultationModel.fromJson(json))
            .toList();

        final consultations = models.toEntities;

        return ApiResult.success(consultations);
      } else {
        return ApiResult.failure(
          ErrorHandler(
            message: response.data['errorMessage'] ?? 'Failed to load doctor consultations',
            statusCode: response.statusCode ?? 500,
            data: response.data,
          ),
        );
      }
    } on DioException catch (e) {
      return ApiResult.failure(_handleDioError(e));
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler(
          message: e.toString(),
          statusCode: 500,
        ),
      );
    }
  }

  // ============ ACCEPT CONSULTATION ============
  @override
  Future<ApiResult<AcceptResponse>> acceptConsultation({
    required int consultationId,
    required int doctorId,
    String? diagnosis,
    String? notes,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        if (diagnosis != null && diagnosis.isNotEmpty) 'reason': diagnosis,
        if (notes != null && notes.isNotEmpty) 'notes': notes,
      };

      final response = await dio.post(
        '/Consultation/accept/$consultationId',
        data: requestData,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final acceptResponse = AcceptResponse.fromJson(response.data);

        if (acceptResponse.success == true) {
          return ApiResult.success(acceptResponse);
        } else {
          return ApiResult.failure(
            ErrorHandler(
              message: acceptResponse.errorMessage ?? 'Accept action failed',
              statusCode: 400,
              data: response.data,
            ),
          );
        }
      } else {
        return ApiResult.failure(
          ErrorHandler(
            message: response.data['errorMessage'] ?? 'Failed to accept consultation',
            statusCode: response.statusCode ?? 500,
            data: response.data,
          ),
        );
      }
    } on DioException catch (e) {
      return ApiResult.failure(_handleDioError(e));
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler(
          message: e.toString(),
          statusCode: 500,
        ),
      );
    }
  }

  // ============ REJECT CONSULTATION ============
  @override
  Future<ApiResult<RejectedResponse>> rejectConsultation({
    required int consultationId,
    required int doctorId,
    required String reason,
    String? notes,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        'reason': reason,
        if (notes != null && notes.isNotEmpty) 'notes': notes,
      };

      final response = await dio.post(
        '/Consultation/reject/$consultationId',
        data: requestData,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final rejectedResponse = RejectedResponse.fromJson(response.data);

        if (rejectedResponse.success == true) {
          return ApiResult.success(rejectedResponse);
        } else {
          return ApiResult.failure(
            ErrorHandler(
              message: rejectedResponse.errorMessage ?? 'Reject action failed',
              statusCode: 400,
              data: response.data,
            ),
          );
        }
      } else {
        return ApiResult.failure(
          ErrorHandler(
            message: response.data['errorMessage'] ?? 'Failed to reject consultation',
            statusCode: response.statusCode ?? 500,
            data: response.data,
          ),
        );
      }
    } on DioException catch (e) {
      return ApiResult.failure(_handleDioError(e));
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler(
          message: e.toString(),
          statusCode: 500,
        ),
      );
    }
  }

  // ============ MODIFY CONSULTATION ============
  @override
  Future<ApiResult<ModifyResponse>> modifyConsultation({
    required int consultationId,
    required int doctorId,
    String? symptoms,
    String? diagnosis,
    String? notes,
    required String modificationReason,
  }) async {
    try {
      final Map<String, dynamic> requestData = {
        'modificationReason': modificationReason,
        if (symptoms != null && symptoms.isNotEmpty) 'symptoms': symptoms,
        if (diagnosis != null && diagnosis.isNotEmpty) 'diagnosis': diagnosis,
        if (notes != null && notes.isNotEmpty) 'notes': notes,
      };

      final response = await dio.post(
        '/Consultation/modify/$consultationId',
        data: requestData,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final modifyResponse = ModifyResponse.fromJson(response.data);

        if (modifyResponse.success == true) {
          return ApiResult.success(modifyResponse);
        } else {
          return ApiResult.failure(
            ErrorHandler(
              message: modifyResponse.errorMessage ?? 'Modify action failed',
              statusCode: 400,
              data: response.data,
            ),
          );
        }
      } else {
        return ApiResult.failure(
          ErrorHandler(
            message: response.data['errorMessage'] ?? 'Failed to modify consultation',
            statusCode: response.statusCode ?? 500,
            data: response.data,
          ),
        );
      }
    } on DioException catch (e) {
      return ApiResult.failure(_handleDioError(e));
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler(
          message: e.toString(),
          statusCode: 500,
        ),
      );
    }
  }

  // ============ SEARCH CONSULTATIONS ============
  @override
  Future<ApiResult<List<Consultation>>> searchConsultations({
    String? query,
    String? status,
    DateTime? fromDate,
    DateTime? toDate,
  }) async {
    try {
      final Map<String, dynamic> queryParams = {};

      if (query != null && query.isNotEmpty) {
        queryParams['query'] = query;
      }
      if (status != null && status.isNotEmpty) {
        queryParams['status'] = status;
      }
      if (fromDate != null) {
        queryParams['fromDate'] = fromDate.toIso8601String();
      }
      if (toDate != null) {
        queryParams['toDate'] = toDate.toIso8601String();
      }

      final response = await dio.get(
        '/Consultation/search',
        queryParameters: queryParams,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data;

        if (response.data is Map && response.data.containsKey('consultations')) {
          data = response.data['consultations'] as List<dynamic>;
        } else if (response.data is List) {
          data = response.data as List<dynamic>;
        } else {
          return ApiResult.failure(
            ErrorHandler(
              message: 'Invalid response format',
              statusCode: 500,
              data: response.data,
            ),
          );
        }

        final models = data
            .map((json) => ConsultationModel.fromJson(json))
            .toList();

        final consultations = models.toEntities;

        return ApiResult.success(consultations);
      } else {
        return ApiResult.failure(
          ErrorHandler(
            message: response.data['errorMessage'] ?? 'Search failed',
            statusCode: response.statusCode ?? 500,
            data: response.data,
          ),
        );
      }
    } on DioException catch (e) {
      return ApiResult.failure(_handleDioError(e));
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler(
          message: e.toString(),
          statusCode: 500,
        ),
      );
    }
  }

  // ============ ERROR HANDLING ============
  ErrorHandler _handleDioError(DioException e) {
    final statusCode = e.response?.statusCode ?? 500;

    String errorMessage;
    dynamic errorData;

    if (e.response?.data != null) {
      if (e.response!.data is Map && e.response!.data.containsKey('errorMessage')) {
        errorMessage = e.response!.data['errorMessage'] as String;
        errorData = e.response!.data;
      } else if (e.response!.data is String) {
        errorMessage = e.response!.data as String;
      } else {
        errorMessage = e.message ?? 'Network error occurred';
        errorData = e.response!.data;
      }
    } else {
      errorMessage = e.message ?? 'Network error occurred';
    }

    // Handle specific error types
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Connection timeout. Please check your internet connection.';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Send timeout. Please try again.';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Receive timeout. Server is taking too long to respond.';
        break;
      case DioExceptionType.badCertificate:
        errorMessage = 'Certificate error. Please contact support.';
        break;
      case DioExceptionType.badResponse:
      // Already handled above
        break;
      case DioExceptionType.cancel:
        errorMessage = 'Request was cancelled.';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'Connection error. Please check your internet connection.';
        break;
      case DioExceptionType.unknown:
        errorMessage = 'Unknown error occurred.';
        break;
    }

    return ErrorHandler(
      message: errorMessage,
      statusCode: statusCode,
      data: errorData,
    );
  }

  // ============ CACHE METHODS (Optional) ============
  Future<void> cacheConsultation(Consultation consultation) async {
    // Implement local caching if needed
    // await SharedPreferences.getInstance().then((prefs) {
    //   prefs.setString('cached_consultation_${consultation.id}',
    //     jsonEncode(consultation.toJson()));
    // });
  }

  Future<Consultation?> getCachedConsultation(int id) async {
    // Get from cache
    return null;
  }
}