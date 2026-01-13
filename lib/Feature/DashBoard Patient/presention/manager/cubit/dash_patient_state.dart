part of 'dash_patient_cubit.dart';

@immutable
sealed class DashPatientState {}

class DashPatientinitialState extends DashPatientState {}

//Get recent inquiries
class GetrecentinquiriesLoadingState extends DashPatientState {}

class GetrecentinquiriesFailure extends DashPatientState {
  final String errMessage;

  GetrecentinquiriesFailure({required this.errMessage});
}

class GetrecentinquiriesSuccess extends DashPatientState {
  final List<RecentInguiriesModel> recentInguirieList;

  GetrecentinquiriesSuccess({required this.recentInguirieList});
}

//Get pending inquiries count
class GetpendinginquiriescountLoadingState extends DashPatientState {}

class GetpendinginquiriescountFailure extends DashPatientState {
  final String errMessage;

  GetpendinginquiriescountFailure({required this.errMessage});
}

class GetpendinginquiriescountSuccess extends DashPatientState {
  final PendingInquiriesModel pendingInquiriesModel;

  GetpendinginquiriescountSuccess(this.pendingInquiriesModel);
}

//symptoms severity
class SymptomsSeverityLoadingState extends DashPatientState {}

class SymptomsSeverityFailure extends DashPatientState {
  final String errMessage;

  SymptomsSeverityFailure({required this.errMessage});
}

class SymptomsSeveritySuccess extends DashPatientState {
  final SymptomSeverityModel symptomSeverityModel;

  SymptomsSeveritySuccess({required this.symptomSeverityModel});
}

//top symptom
class TopSymptomLoadingState extends DashPatientState {}

class TopSymptomFailure extends DashPatientState {
  final String errMessage;

  TopSymptomFailure({required this.errMessage});
}

class TopSymptomSuccess extends DashPatientState {
  final TopsysmptomModel topsysmptomModel;

  TopSymptomSuccess({required this.topsysmptomModel});
}
