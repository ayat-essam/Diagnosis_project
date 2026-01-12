import 'package:bloc/bloc.dart';
import 'package:diagnosis_project/Feature/DashBoard%20Patient/domain/repo/dashboard_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dash_patient_state.dart';

class DashPatientCubit extends Cubit<DashPatientState> {
  DashPatientCubit(this.dashboardRepo) : super(DashPatientinitialState());
  final DashboardRepo dashboardRepo;
  Future<void> getrecentinquiries() async {
    emit(GetrecentinquiriesLoadingState());
    var result = await dashboardRepo.getrecentinquiries();
    result.fold((l) {
      emit(GetrecentinquiriesFailure(errMessage: l.errMessge));
    }, (r) {
      emit(GetrecentinquiriesSuccess(recentinquiriesList: r));
    });
  }

  Future<void> getpendinginquiriescount() async {
    emit(GetpendinginquiriescountLoadingState());
    var result = await dashboardRepo.getpendinginquiriescount();
    result.fold((l) {
      emit(GetpendinginquiriescountFailure(errMessage: l.errMessge));
    }, (r) {
      emit(GetpendinginquiriescountSuccess(recentinquiriesList: r));
    });
  }

  Future<void> getsymptomsseverity() async {
    emit(SymptomsSeverityLoadingState());
    var result = await dashboardRepo.symptomsseverity();
    result.fold((l) {
      emit(SymptomsSeverityFailure(errMessage: l.errMessge));
    }, (r) {
      emit(SymptomsSeveritySuccess(recentinquiriesList: r));
    });
  }

  Future<void> gettopsymptom() async {
    emit(TopSymptomLoadingState());
    var result = await dashboardRepo.topsymptom();
    result.fold((l) {
      emit(TopSymptomFailure(errMessage: l.errMessge));
    }, (r) {
      emit(TopSymptomSuccess(recentinquiriesList: r));
    });
  }
}
