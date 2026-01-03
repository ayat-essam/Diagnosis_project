// consultation_repository.dart
import '../../domain/entity/consultation.dart';
import '../models/accept_response.dart';
import '../models/modify_response.dart';
import '../models/rejected_response.dart';
import '../../../core/network/api_result.dart';

abstract class ConsultationRepository {
  Future<ApiResult<Consultation>> getConsultationDetails(int id);

  Future<ApiResult<List<Consultation>>> getAllConsultations();

  Future<ApiResult<List<Consultation>>> getConsultationsByDoctor({
    required int doctorId,
    int page,
    int limit,
  });

  Future<ApiResult<AcceptResponse>> acceptConsultation({
    required int consultationId,
    required int doctorId,
    String? diagnosis,
    String? notes,
  });

  Future<ApiResult<RejectedResponse>> rejectConsultation({
    required int consultationId,
    required int doctorId,
    required String reason,
    String? notes,
  });

  Future<ApiResult<ModifyResponse>> modifyConsultation({
    required int consultationId,
    required int doctorId,
    String? symptoms,
    String? diagnosis,
    String? notes,
    required String modificationReason,
  });

  Future<ApiResult<List<Consultation>>> searchConsultations({
    String? query,
    String? status,
    DateTime? fromDate,
    DateTime? toDate,
  });
}