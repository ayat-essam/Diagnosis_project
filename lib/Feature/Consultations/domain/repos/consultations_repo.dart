import '../../../../Core/Network/api_result.dart';
import '../../Data/models/accept_con_request.dart';
import '../../Data/models/modifey_con_request.dart';
import '../../Data/models/rejected_consultation_request .dart';
import '../../domain/entity/consultation.dart';


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

}