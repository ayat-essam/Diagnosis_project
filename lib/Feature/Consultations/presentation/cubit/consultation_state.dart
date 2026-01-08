import '../../domain/entity/consultation.dart';


sealed class ConsultationState {}

class ConsultationStateInitial extends ConsultationState {}

class ConsultationLoading extends ConsultationState {
  final String? message;
  ConsultationLoading({this.message});
}

class ConsultationDetailsLoaded extends ConsultationState {
  final Consultation consultation;
  ConsultationDetailsLoaded(this.consultation);
}

class ConsultationsListLoaded extends ConsultationState {
  final List<Consultation> consultations;
  ConsultationsListLoaded(this.consultations);
}


class ConsultationAcceptLoading extends ConsultationState {
  final int consultationId;
  ConsultationAcceptLoading(this.consultationId);
}

class ConsultationAcceptFailure extends ConsultationState {
  final int consultationId;
  final String message;
  ConsultationAcceptFailure(this.consultationId, this.message);
}

class ConsultationAcceptSuccess extends ConsultationState {
  final int consultationId;
  final String message;
  ConsultationAcceptSuccess(this.consultationId, this.message);
}

class ConsultationRejectLoading extends ConsultationState {
  final int consultationId;
  ConsultationRejectLoading(this.consultationId);
}

class ConsultationRejectFailure extends ConsultationState {
  final int consultationId;
  final String reason;
  final String message;
  ConsultationRejectFailure(
      this.consultationId,
      this.reason,
      this.message,
      );
}

class ConsultationRejectSuccess extends ConsultationState {
  final int consultationId;
  final String reason;
  final String message;
  ConsultationRejectSuccess(
      this.consultationId,
      this.reason,
      this.message,
      );
}

class ConsultationModifyLoading extends ConsultationState {
  final int consultationId;
  ConsultationModifyLoading(this.consultationId);
}

class ConsultationModifyFailure extends ConsultationState {
  final int consultationId;
  final String message;
  ConsultationModifyFailure(this.consultationId, this.message);
}

class ConsultationModifySuccess extends ConsultationState {
  final Consultation consultation;
  ConsultationModifySuccess(this.consultation);
}


class ConsultationError extends ConsultationState {
  final String message;
  ConsultationError(this.message);
}


class ConsultationEmpty extends ConsultationState {}