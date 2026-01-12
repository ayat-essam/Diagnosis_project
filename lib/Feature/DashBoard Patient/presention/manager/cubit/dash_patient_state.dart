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
  final List recentinquiriesList;

  GetrecentinquiriesSuccess({required this.recentinquiriesList});
}

//Get pending inquiries count
class GetpendinginquiriescountLoadingState extends DashPatientState {}

class GetpendinginquiriescountFailure extends DashPatientState {
  final String errMessage;

  GetpendinginquiriescountFailure({required this.errMessage});
}

class GetpendinginquiriescountSuccess extends DashPatientState {
  final List recentinquiriesList;

  GetpendinginquiriescountSuccess({required this.recentinquiriesList});
}

//symptoms severity
class SymptomsSeverityLoadingState extends DashPatientState {}

class SymptomsSeverityFailure extends DashPatientState {
  final String errMessage;

  SymptomsSeverityFailure({required this.errMessage});
}

class SymptomsSeveritySuccess extends DashPatientState {
  final List recentinquiriesList;

  SymptomsSeveritySuccess({required this.recentinquiriesList});
}

//top symptom
class TopSymptomLoadingState extends DashPatientState {}

class TopSymptomFailure extends DashPatientState {
  final String errMessage;

  TopSymptomFailure({required this.errMessage});
}

class TopSymptomSuccess extends DashPatientState {
  final List recentinquiriesList;

  TopSymptomSuccess({required this.recentinquiriesList});
}
