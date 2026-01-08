
import 'package:diagnosis_project/Feature/Consultations/domain/entity/consultation.dart';
import 'package:equatable/src/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Domain/entity/consultation.dart';
import '../../Domain/repos/consultations_repo.dart';
import 'consultation_state.dart';

class ConsultationCubit extends Cubit<ConsultationState> {
  final ConsultationRepository _repository;

  ConsultationCubit(this._repository) : super(ConsultationStateInitial());

  // ============ GET CONSULTATION DETAILS ============
  Future<void> getConsultationDetails(int consultationId) async {
    // Avoid reloading if already viewing the same consultation
    if (state is ConsultationDetailsLoaded) {
      final currentState = state as ConsultationDetailsLoaded;
      if (currentState.consultation.id == consultationId) {
        return;
      }
    }

    emit(ConsultationLoading(message: 'Loading consultation details...'));

    final result = await _repository.getConsultationDetails(consultationId);

    result.when(
      success: (Consultation consultation) {
        if (consultation.success) {
          emit(ConsultationDetailsLoaded(consultation));
        } else {
          emit(ConsultationError(
            consultation.errorMessage ?? 'Failed to load consultation',
          ));
        }
      },
      failure: (error) {
        emit(ConsultationError(error.message));
      },
    );
  }

  // ============ GET ALL CONSULTATIONS ============
  Future<void> getAllConsultations({bool refresh = false}) async {
    if (refresh) {
      emit(ConsultationLoading(message: 'Refreshing list...'));
    } else {
      emit(ConsultationLoading(message: 'Loading consultations...'));
    }

    final result = await _repository.getAllConsultations();

    result.when(
      success: (List<Consultation> consultations) {
        if (consultations.isEmpty) {
          emit(ConsultationEmpty());
        } else {
          emit(ConsultationsListLoaded(consultations));
        }
      },
      failure: (error) {
        emit(ConsultationError(error.message));
      },
    );
  }

  Future<void> getConsultationsByDoctor({
    required int doctorId,
    int page = 1,
    int limit = 10,
  }) async {
    emit(ConsultationLoading(message: 'Loading doctor consultations...'));

    final result = await _repository.getConsultationsByDoctor(
      doctorId: doctorId,
      page: page,
      limit: limit,
    );

    result.when(
      success: (List<Consultation> consultations) {
        if (consultations.isEmpty) {
          emit(ConsultationEmpty());
        } else {
          emit(ConsultationsListLoaded(consultations));
        }
      },
      failure: (error) {
        emit(ConsultationError(error.message));
      },
    );
  }


  Future<void> acceptConsultation({
    required int consultationId,
    required int doctorId,
    String? diagnosis,
    String? notes,
  }) async {
    emit(ConsultationAcceptLoading(consultationId));

    final result = await _repository.acceptConsultation(
      consultationId: consultationId,
      doctorId: doctorId,
      diagnosis: diagnosis,
      notes: notes,
    );

    result.when(
      success: (response) {
        if (response.success) {
          emit(ConsultationAcceptSuccess(
            consultationId,
            response.errorMessage ?? 'Consultation accepted successfully',
          ));

          // Refresh the consultation details
          _refreshConsultationAfterAction(consultationId);
        } else {
          emit(ConsultationAcceptFailure(
            consultationId,
            response.errorMessage ?? 'Failed to accept consultation',
          ));
        }
      },
      failure: (error) {
        emit(ConsultationAcceptFailure(
          consultationId,
          error.message,
        ));
      },
    );
  }

  Future<void> rejectConsultation({
    required int consultationId,
    required int doctorId,
    required String reason,
    String? notes,
  }) async {
    emit(ConsultationRejectLoading(consultationId));

    final result = await _repository.rejectConsultation(
      consultationId: consultationId,
      doctorId: doctorId,
      reason: reason,
      notes: notes,
    );

    result.when(
      success: (response) {
        if (response.success) {
          emit(ConsultationRejectSuccess(
            consultationId,
            reason,
            response.errorMessage ?? 'Consultation rejected successfully',
          ));

        } else {
          emit(ConsultationRejectFailure(
            consultationId,
            reason,
            response.errorMessage ?? 'Failed to reject consultation',
          ));
        }
      },
      failure: (error) {
        emit(ConsultationRejectFailure(
          consultationId,
          reason,
          error.message,
        ));
      },
    );
  }

  Future<void> modifyConsultation({
    required int consultationId,
    required int doctorId,
    String? symptoms,
    String? diagnosis,
    String? notes,
    required String modificationReason,
  }) async {
    emit(ConsultationModifyLoading(consultationId));

    final result = await _repository.modifyConsultation(
      consultationId: consultationId,
      doctorId: doctorId,
      symptoms: symptoms,
      diagnosis: diagnosis,
      notes: notes,
      modificationReason: modificationReason,
    );

    result.when(
      success: (response) {
        if (response.success) {
          if (response.consultationId != null) {
            emit(ConsultationModifySuccess(response.notes as Consultation));

          } else {
            emit(ConsultationModifySuccess(
              Consultation(
                id: consultationId,
                patientName: '',
                patientBirthDate: DateTime.now(),
                patientGender: '',
                symptoms: symptoms ?? '',
                response: diagnosis,
                requestDate: DateTime.now(),
                notes: notes,
                attachments: [],
                success: true,
                errorMessage: null,
              ),
            ));
          }


        } else {
          emit(ConsultationModifyFailure(
            consultationId,
            response.errorMessage ?? 'Failed to modify consultation',
          ));
        }
      },
      failure: (error) {
        emit(ConsultationModifyFailure(
          consultationId,
          error.message,
        ));
      },
    );
  }

   void _refreshConsultationAfterAction(int consultationId) {
    Future.delayed(const Duration(milliseconds: 500), () {
      getConsultationDetails(consultationId);
    });
  }

  }





