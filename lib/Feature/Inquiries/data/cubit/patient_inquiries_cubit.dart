import 'package:diagnosis_project/Feature/Inquiries/data/cubit/patient_inquiries_state.dart';
import 'package:diagnosis_project/generated/intl/messages_ar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_patient_inquiries_usecase.dart';
class PatientInquiriesCubit extends Cubit<PatientInquiriesState> {
  final GetPatientInquiriesUseCase useCase;

  PatientInquiriesCubit(this.useCase)
      : super(PatientInquiriesInitial());

  void loadInquiries(int patientId) async {
  emit(PatientInquiriesLoading());

  final result = await useCase(patientId: patientId);

  result.fold(
    (error) => emit(PatientInquiriesError(error.errorMessage)),
    (data) => emit(PatientInquiriesLoaded(data)),
  );
}

}
